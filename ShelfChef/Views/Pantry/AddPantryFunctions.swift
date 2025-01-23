import CoreML
import SwiftUI
import Vision
import UIKit
import ChatGPTSwift

class AddPantryFunctions {
    let api = ChatGPTAPI(apiKey: "ChatGPT-api-key")
    func filterQuantityInput(_ input: String) -> String {
        var filtered = input.filter { "0123456789.".contains($0) }
        let decimalCount = filtered.filter { $0 == "." }.count
        if decimalCount > 1 {
            filtered = String(filtered.dropLast())
        }
        return filtered
    }
    func processImage(image: UIImage?, completion: @escaping (String?) -> Void) {
        guard let image = image else {
            completion(nil)
            return
        }
        recognizeTextInImage(image: image) { text in
            if let recognizedText = text, !recognizedText.isEmpty {
                self.fetchFoodItemFromAI(for: recognizedText, completion: completion)
            } else {
                self.classifyCapturedImage(image: image, completion: completion)
            }
        }
    }

    private func recognizeTextInImage(image: UIImage, completion: @escaping (String?) -> Void) {
        guard let cgImage = image.cgImage else {
            completion(nil)
            return
        }
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            if let error = error {
                print("Text recognition error: \(error)")
                completion(nil)
                return
            }
            
            if let observations = request.results as? [VNRecognizedTextObservation] {
                let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
                let recognizedText = recognizedStrings.joined(separator: " ")
                completion(recognizedText)
            } else {
                completion(nil)
            }
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try requestHandler.perform([textRecognitionRequest])
            } catch {
                print("Failed to perform text recognition: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    func classifyCapturedImage(image: UIImage?, completion: @escaping (String?) -> Void) {
        guard let image = image else {
            completion(nil)
            return
        }
        guard let resizedImage = image.resized(to: CGSize(width: 224, height: 224)),
              let pixelBuffer = resizedImage.toCVPixelBuffer() else {
            print("Error resizing or converting image to pixel buffer.")
            completion(nil)
            return
        }

        do {
            let config = MLModelConfiguration()
            let model = try MobileNetV2(configuration: config)
            let input = MobileNetV2Input(image: pixelBuffer)
            let output = try model.prediction(input: input)
            completion(output.classLabel)
        } catch {
            print("Failed to classify image: \(error.localizedDescription)")
            completion(nil)
        }
    }
    func fetchExpirationDateFromAI(for itemName: String, completion: @escaping (Date?) -> Void) {
        guard !itemName.isEmpty else {
            print("Item name is empty, cannot fetch expiration date.")
            completion(nil)
            return
        }

        Task {
            do {
                let prompt = "What is the suggested expiration date for \(itemName)?"
                let response = try await api.sendMessage(text: prompt)
                print("AI Response for expiration date: \(response)")
                if let days = extractExpirationDays(from: response) {
                    let suggestedDate = Calendar.current.date(byAdding: .day, value: days, to: Date())
                    completion(suggestedDate)
                } else {
                    completion(nil)
                }
            } catch {
                print("Failed to fetch expiration date from AI: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }

    func fetchFoodItemFromAI(for text: String, completion: @escaping (String?) -> Void) {
        Task {
            do {
                let prompt = "What food item does this text describe: \(text)? Tell me a response in the fewest words possible, for example marinara sauce or canned chicken breast."
                let response = try await api.sendMessage(text: prompt)
                completion(response)
            } catch {
                print("Failed to fetch food item from AI: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    private func extractExpirationDays(from response: String) -> Int? {
        let regex = try? NSRegularExpression(pattern: "\\d+ days", options: [])
        if let match = regex?.firstMatch(in: response, options: [], range: NSRange(location: 0, length: response.utf16.count)) {
            let matchString = (response as NSString).substring(with: match.range)
            return Int(matchString.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())
        }
        return nil
    }
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
}
extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }

    func toCVPixelBuffer() -> CVPixelBuffer? {
        let width = Int(self.size.width)
        let height = Int(self.size.height)
        
        var pixelBuffer: CVPixelBuffer?
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
                     kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        
        guard let buffer = pixelBuffer else { return nil }
        CVPixelBufferLockBaseAddress(buffer, [])
        let pixelData = CVPixelBufferGetBaseAddress(buffer)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: width, height: height, bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(buffer), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.translateBy(x: 0, y: CGFloat(height))
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        self.draw(in: CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height)))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(buffer, [])
        
        return buffer
        func resized(to size: CGSize) -> UIImage? {
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                draw(in: CGRect(origin: .zero, size: size))
                let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return resizedImage
            }
    }
}

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    var onImageCaptured: (() -> Void)?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
                parent.onImageCaptured?()
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}


func classifyFoodImage(image: UIImage, completion: @escaping (String?) -> Void) {
    guard let ciImage = CIImage(image: image) else {
        completion(nil)
        return
    }
    
    guard let model = try? VNCoreMLModel(for: MobileNetV2().model) else {
        print("Failed to load MobileNetV2 model")
        completion(nil)
        return
    }
    
    let request = VNCoreMLRequest(model: model) { request, error in
        if let error = error {
            print("Error during classification: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        guard let results = request.results as? [VNClassificationObservation],
              let firstResult = results.first else {
            completion(nil)
            return
        }
        
        completion(firstResult.identifier)
    }
    
    let handler = VNImageRequestHandler(ciImage: ciImage)
    DispatchQueue.global(qos: .userInitiated).async {
        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform classification: \(error.localizedDescription)")
            completion(nil)
        }
    }
}


import SwiftUI
import VisionKit
import CoreML
import Vision

@available(iOS 15.0, *)
struct AddPantryItemView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var pantryItems: [PantryItem]

    @State private var name: String = ""
    @State private var quantity: String = ""
    @State private var unit: PantryItem.UnitType = .ounces
    @State private var expirationDate = Date()
    @State private var isFetchingExpiration = false
    @State private var aiSuggestedDate: Date? = nil
    @State private var isShowingCamera = false
    @State private var capturedImage: UIImage? = nil
    @State private var suggestedFood: String? = nil 

    let helpers = AddPantryFunctions()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Ingredient")) {
                    TextField("Ingredient Name", text: $name)
                        .autocapitalization(.words)
                        .onChange(of: name) { newValue in
                            name = newValue.capitalized
                        }
                    if let suggestedFood = suggestedFood {
                        Button(action: {
                            name = suggestedFood
                        }) {
                            Text("Identified as: \(suggestedFood)")
                                .foregroundColor(.blue)
                                .underline()
                        }
                    }
                    Button(action: {
                        isShowingCamera = true
                    }) {
                        Text("Identify Food Item from Camera")
                    }
                }
                Section(header: Text("Quantity")) {
                    TextField("Quantity", text: $quantity)
                        .keyboardType(.decimalPad)
                        .onChange(of: quantity) { newValue in
                            quantity = helpers.filterQuantityInput(newValue)
                        }
                }
                Section(header: Text("Unit")) {
                    Picker(selection: $unit, label: Text("Unit")) {
                        ForEach(PantryItem.UnitType.allCases, id: \.self) { unit in
                            Text(unit.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section(header: Text("Expiration Date")) {
                    DatePicker("Expiration Date", selection: $expirationDate, displayedComponents: .date)

                    Button(action: {
                        guard !name.isEmpty else { return }

                        isFetchingExpiration = true
                        helpers.fetchExpirationDateFromAI(for: name) { date in
                            DispatchQueue.main.async {
                                if let aiDate = date {
                                    expirationDate = aiDate
                                }
                                isFetchingExpiration = false
                            }
                        }
                    }) {
                        Text("Suggest Expiration Date")
                    }
                    .disabled(name.isEmpty || isFetchingExpiration)
                }

            }
            .navigationTitle("Add Ingredient")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let quantityValue = Double(quantity) ?? 0.0
                        let newItem = PantryItem(name: name, quantity: quantityValue, unit: unit, expirationDate: expirationDate)
                        pantryItems.append(newItem)
                        dismiss()
                    }
                }
            }
            .sheet(isPresented: $isShowingCamera) {
                ImagePicker(image: $capturedImage, onImageCaptured: {
                    if let capturedImage = capturedImage {
                        helpers.processImage(image: capturedImage) { result in
                            suggestedFood = result
                        }
                    }
                })
            }
        }
    }
}


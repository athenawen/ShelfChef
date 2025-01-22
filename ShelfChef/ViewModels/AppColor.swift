import SwiftUI

struct AppColor {
    static let background = Color(.sRGB,
                                  red: 225,
                                  green: 225,
                                  blue: 225,
                                  opacity: 1)
    static let foreground = Color(.blue)
}

extension Color: @retroactive RawRepresentable {
    public init?(rawValue: String) {
        do {
            let encodedData = rawValue.data(using: .utf8)!
            let components = try JSONDecoder().decode([Double].self, from: encodedData)
            self = Color(red: components[0], green: components[1], blue: components[2], opacity: components[3])
        }
        catch {
            return nil
        }
    }

    public var rawValue: String {
        guard let cgFloatComponents = UIColor(self).cgColor.components else { return "" }
        let doubleComponents = cgFloatComponents.map { Double($0) }
        do {
            let encodedComponents = try JSONEncoder().encode(doubleComponents)
            return String(data: encodedComponents, encoding: .utf8) ?? ""
        }
        catch {
            return ""
        }
    }
}

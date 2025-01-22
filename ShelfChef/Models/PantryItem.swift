import Foundation

struct PantryItem: Identifiable, Codable {
    let id = UUID() 
    var name: String
    var quantity: Double
    var unit: UnitType
    var expirationDate: Date

    init(name: String, quantity: Double, unit: UnitType, expirationDate: Date) {
        self.name = name
        self.quantity = quantity
        self.unit = unit
        self.expirationDate = expirationDate
    }
        
        enum UnitType: String, Codable, CaseIterable {
            case ounces = "oz"
            case milliliters = "ml"
            case grams = "g"
            case liters = "L"
            case pounds = "lbs"
            case kilograms = "kg"
            
            var description: String {
                return self.rawValue
            
        }
    }
}

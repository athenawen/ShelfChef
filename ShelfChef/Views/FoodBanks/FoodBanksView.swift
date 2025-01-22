import SwiftUI
import MapKit

struct FoodBanksView: View {
    let foodBank: FoodBank
    @Binding var selectedFoodItem: String
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    
    @State private var searchQuery: String = ""
    @State private var searchResults: [MKLocalSearchCompletion] = []
    @State private var selectedFoodBank: FoodBank? = nil
    @State private var searchCompleter = MKLocalSearchCompleter()
    @StateObject private var locationManager = LocationManager()
    @State private var hasTeleportedToUserLocation = false
    @Binding var selectedPantryItems: Set<String>
    let foodBanks = FoodBankStore().getAllFoodBanks()

    @State private var showForm = false

    var body: some View {
        VStack(spacing: 10) {
            Text(foodBank.name)
                .font(.headline)
            Text(foodBank.address)
                .font(.subheadline)
            Text("Phone: \(foodBank.phoneNumber)")
                .font(.subheadline)
            Link("Visit Website", destination: URL(string: foodBank.website)!)
                .font(.subheadline)
                .foregroundColor(.blue)

            Button(action: {
                openInMaps()
            }) {
                Text("Get Directions")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }

            Button(action: {
                showForm = true
            }) {
                Text("Donate Food")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .sheet(isPresented: $showForm) {
            FirstNameView()
        }
    }
    
    func openInMaps() {
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: foodBank.coordinate.latitude, longitude: foodBank.coordinate.longitude))
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = foodBank.name
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
    }
}

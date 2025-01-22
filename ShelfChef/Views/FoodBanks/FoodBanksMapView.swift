import SwiftUI
import MapKit
import CoreLocation

struct FoodBanksMapView: View {
    @Binding var region: MKCoordinateRegion
    @Binding var selectedFoodItem: String?
    @Binding var selectedPantryItems: Set<String>
    @State private var searchQuery: String = ""
    @State private var selectedFoodBank: FoodBank? = nil
    @State private var foodBanks: [FoodBank] = FoodBankStore().getAllFoodBanks()
    @StateObject private var locationManager = LocationManager()
    @State private var showFoodBanksMap = false


    var body: some View {
        VStack(spacing: 0) {
            Text("Provided to you by Feeding America")
                .font(.system(size: 16))
                .foregroundColor(.gray)
            HStack {
                if #available(iOS 15.0, *) {
                    TextField("Enter an address", text: $searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onSubmit {
                            performSearch(using: searchQuery, region: $region)
                        }
                }

                Button(action: {
                    teleportToUserLocation(locationManager: locationManager, region: $region)
                }) {
                    Text("Default Location")
                        .foregroundColor(.blue)
                }
                .padding(.trailing)
            }
            ZStack {
                Map(coordinateRegion: $region, annotationItems: foodBanks) { foodBank in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: foodBank.coordinate.latitude, longitude: foodBank.coordinate.longitude)) {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                selectedFoodBank = foodBank
                            }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .gesture(TapGesture().onEnded {
                    selectedFoodBank = nil
                })
                if let foodBank = selectedFoodBank {
                    VStack {
                        Spacer()
                        FoodBanksView(foodBank: foodBank, selectedFoodItem: .constant(selectedFoodItem ?? ""), selectedPantryItems: $selectedPantryItems)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                    }
                }
            }
        }
        .onAppear {
            teleportToUserLocation(locationManager: locationManager, region: $region)
        }
        .navigationTitle("Find a Food Bank")
    }
}


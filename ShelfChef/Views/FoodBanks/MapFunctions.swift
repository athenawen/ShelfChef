import MapKit
import SwiftUI
import CoreLocation

func teleportToUserLocation(locationManager: LocationManager, region: Binding<MKCoordinateRegion>) {
    if let userLocation = locationManager.location?.coordinate {
        region.wrappedValue = MKCoordinateRegion(
            center: userLocation,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    } else {
        print("User location not available.")
    }
}
func performSearch(using query: String, region: Binding<MKCoordinateRegion>) {
    let searchRequest = MKLocalSearch.Request()
    searchRequest.naturalLanguageQuery = query

    let search = MKLocalSearch(request: searchRequest)
    search.start { response, error in
        guard let response = response, let mapItem = response.mapItems.first else {
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
            return
        }

        let coordinate = mapItem.placemark.coordinate
        region.wrappedValue = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }
}
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var location: CLLocation?
    
    var region: MKCoordinateRegion {
        if let location = location {
            return MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        } else {
            return MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
            )
        }
    }

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first
    }
}



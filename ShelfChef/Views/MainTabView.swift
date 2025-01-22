import SwiftUI
import MessageUI
import MapKit

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    @State private var pantryItems: [PantryItem] = []
    @State private var selectedFoodItem: String? = nil 
    @State private var selectedPantryItems: Set<String> = []
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        TabView {
            RecipeCategoryScrollView()
            .tabItem {
                Label("Recipes", systemImage: "list.dash")
                }
            NavigationView {
                RecipesListView(viewStyle: .favorites)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
            NavigationView {
                PantryView(pantryItems: $pantryItems)
            }
            .tabItem {
                Label("Pantry", systemImage: "cart")
            }
            NavigationView {
                ListsView()
            }
            .tabItem {
                Label("Lists", systemImage: "list.dash")
            }
        }
        .accentColor(.blue)
        .background(Color.white)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor.white

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            UITabBar.appearance().standardAppearance = appearance
        }
        .environmentObject(recipeData)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}


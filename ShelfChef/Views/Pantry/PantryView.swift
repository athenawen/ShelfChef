import SwiftUI
import MapKit

struct PantryView: View {
    @Binding var pantryItems: [PantryItem]
    @State private var isAddingNewItem = false
    @State private var showFoodBanksMap = false
    @State private var selectedPantryItem: String? = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @StateObject private var locationManager = LocationManager()
    @State private var isSelecting = false
    @State private var selectedPantryItems: Set<String> = []
    @State private var recipes: [Recipe] = []
    
    @EnvironmentObject private var recipeData: RecipeData
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isSelecting.toggle()
                }) {
                }
                Spacer()
                if isSelecting && !selectedPantryItems.isEmpty {
                    Button(action: {
                        showFoodBanksMap = true
                    }) {
                        Text("Donate")
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 16)
                }
            }
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Ingredients with a Star Can Be Donated to Food Charities")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding([.top, .leading, .trailing])
            
            List {
                ForEach(pantryItems, id: \.name) { item in
                    HStack {
                        Text("\(item.name) - \(item.quantity, specifier: "%.2f") \(item.unit.description)")
                        Spacer()
                        Text(dateFormatter.string(from: item.expirationDate))
                            .foregroundColor(.gray)
                        
                        if isSelecting {
                            if isStarred(itemName: item.name) {
                                   Image(systemName: selectedPantryItems.contains(item.name) ? "checkmark.circle.fill" : "circle")
                                       .foregroundColor(.blue)
                                       .onTapGesture {
                                           toggleSelection(for: item)
                                    }
                            }
                        } else if isStarred(itemName: item.name) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .onDelete(perform: deleteItem)
            }
            if !pantryItems.isEmpty {
                Text("Recipes Sorted By Expiration Date:")
                    .font(.headline)
                    .bold()
                    .padding([.top, .bottom])
                List {
                    ForEach(sortedRecipes, id: \.id) { recipe in
                        if let recipeBinding = binding(for: recipe) {
                            NavigationLink(destination: RecipeDetailView(recipe: recipeBinding)) {
                                Text(recipe.mainInformation.name)
                            }
                        }
                    }
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Pantry")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: { isAddingNewItem = true }) {
                    Image(systemName: "plus")
                }
                Button(action: {
                    isSelecting.toggle()
                }) {
                    Text(isSelecting ? "Done" : "Donate")
                        .foregroundColor(.blue)
                        .padding(.trailing, 10)
                }
            }
        }        .sheet(isPresented: $isAddingNewItem) {
            if #available(iOS 15.0, *) {
                AddPantryItemView(pantryItems: $pantryItems)
            } else {
            }
        }
        .onAppear {
            pantryItems = loadPantryItems()
            if let userLocation = locationManager.location?.coordinate {
                region = MKCoordinateRegion(
                    center: userLocation,
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )
            }
        }
        .onDisappear {
            savePantryItems(pantryItems)
        }
        .background(
            NavigationLink(
                destination: FoodBanksMapView(region: $region, selectedFoodItem: $selectedPantryItem, selectedPantryItems: $selectedPantryItems), // Pass selectedPantryItems here
                isActive: $showFoodBanksMap,
                label: { EmptyView() }
            )
        )
    }

    private func toggleSelection(for item: PantryItem) {
        if selectedPantryItems.contains(item.name) {
            selectedPantryItems.remove(item.name)
        } else {
            selectedPantryItems.insert(item.name)
        }
    }


    func isStarred(itemName: String) -> Bool {
        return AbleToDonate.proteins.contains(itemName) ||
               AbleToDonate.vegetablesFruits.contains(itemName) ||
               AbleToDonate.grains.contains(itemName) ||
               AbleToDonate.dairySubstitutes.contains(itemName) ||
               AbleToDonate.meals.contains(itemName) ||
               AbleToDonate.otherStaples.contains(itemName) ||
               AbleToDonate.freshProduce.contains(itemName) ||
               AbleToDonate.frozenItems.contains(itemName) ||
               AbleToDonate.perishableDairy.contains(itemName)
    }

    private func deleteItem(at offsets: IndexSet) {
        pantryItems.remove(atOffsets: offsets)
        savePantryItems(pantryItems)
    }
    
    var sortedRecipes: [Recipe] {
        return recipeData.recipes.filter { recipe in
            recipe.ingredients.contains { ingredient in
                pantryItems.contains { pantryItem in
                    pantryItem.name == ingredient.name
                }
            }
        }
        .sorted { recipe1, recipe2 in
            let minExpirationDate1 = recipe1.ingredients.compactMap { ingredient in
                pantryItems.first { $0.name == ingredient.name }?.expirationDate
            }.min() ?? Date.distantFuture

            let minExpirationDate2 = recipe2.ingredients.compactMap { ingredient in
                pantryItems.first { $0.name == ingredient.name }?.expirationDate
            }.min() ?? Date.distantFuture

            return minExpirationDate1 < minExpirationDate2
        }
    }
    func binding(for recipe: Recipe) -> Binding<Recipe>? {
            guard let index = recipeData.recipes.firstIndex(where: { $0.id == recipe.id }) else {
                return nil
            }
            return $recipeData.recipes[index] 
        }

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }

    func savePantryItems(_ items: [PantryItem]) {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "pantryItems")
        }
    }

    func loadPantryItems() -> [PantryItem] {
        if let savedItems = UserDefaults.standard.data(forKey: "pantryItems"),
           let decodedItems = try? JSONDecoder().decode([PantryItem].self, from: savedItems) {
            return decodedItems
        }
        return []
    }
}


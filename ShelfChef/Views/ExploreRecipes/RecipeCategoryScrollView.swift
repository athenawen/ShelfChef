import SwiftUI

struct RecipeCategoryScrollView: View {
    @EnvironmentObject private var recipeData: RecipeData
    @State private var searchText = ""
    @State private var recipes: [Recipe] = Recipe.testRecipes

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                TextField("Search recipes", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color(.systemBackground))
                    .zIndex(1)

                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        let filteredRecipes = recipes.filter { recipe in
                            recipe.mainInformation.name.lowercased().contains(searchText.lowercased())
                        }

                        if !filteredRecipes.isEmpty {
                            List {
                                ForEach(filteredRecipes, id: \.id) { recipe in
                                    if let recipeBinding = binding(for: recipe) {
                                        NavigationLink(destination: RecipeDetailView(recipe: recipeBinding)) {
                                            Text(recipe.mainInformation.name)
                                        }
                                    }
                                }
                            }
                            .listStyle(PlainListStyle())
                            .frame(height: 300)
                        }

                        if searchText.isEmpty {
                            Text("Categories")
                                .font(.largeTitle)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                                .padding(.top)

                            VStack(spacing: 15) {
                                ForEach(filteredCategories, id: \.self) { category in
                                    NavigationLink(
                                        destination: RecipesListView(viewStyle: .singleCategory(category)),
                                        label: {
                                            CategoryView(category: category)
                                                .frame(height: 150)
                                        })
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = "" // Clear the search text to return to the main view
                        }) {
                            HStack {
                                Image(systemName: "arrow.backward")
                                Text("Back")
                            }
                        }
                    }
                }
            }
        }
    }

    var filteredCategories: [MainInformation.Category] {
        if searchText.isEmpty {
            return MainInformation.Category.allCases
        } else {
            return MainInformation.Category.allCases.filter { category in
                category.rawValue.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    func binding(for recipe: Recipe) -> Binding<Recipe>? {
        guard let index = recipes.firstIndex(where: { $0.id == recipe.id }) else {
            return nil
        }
        return $recipes[index]
    }
}

struct CategoryView: View {
    let category: MainInformation.Category

    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .overlay(Color.black.opacity(0.5))
            Text(category.rawValue)
                .font(.title)
                .foregroundColor(.white)
                .shadow(radius: 5)
                .padding()
        }
        .cornerRadius(10)
    }
}

struct RecipeCategoryScrollView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryScrollView()
            .environmentObject(RecipeData())
    }
}

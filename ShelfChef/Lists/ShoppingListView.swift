import SwiftUI

struct ShoppingListView: View {
    @State private var items: [ShoppingItem] = [
        ShoppingItem(name: "Apples", isChecked: false),
        ShoppingItem(name: "Bananas", isChecked: false),
        ShoppingItem(name: "Milk", isChecked: false)
    ]
    @State private var newItemName = ""
    @State private var isAddingItem = false
    @State private var isEditingNewItem = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($items) { $item in
                        HStack {
                            Button(action: {
                                item.isChecked.toggle()
                            }) {
                                Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isChecked ? .blue : .gray)
                            }
                            Text(item.name)
                                .strikethrough(item.isChecked, color: .gray)
                        }
                    }
                    .onDelete(perform: deleteItem)
                    
                    if isAddingItem {
                        HStack {
                            TextField("Enter new item", text: $newItemName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            Button(action: {
                                addNewItem()
                            }) {
                                Text("Add")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                Spacer()
                
                // Button to Add new item
                HStack {
                    Spacer()
                    Button(action: {
                        isAddingItem = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
            }
            .navigationTitle("Shopping List")
        }
    }

    private func addNewItem() {
        if !newItemName.isEmpty {
            let newItem = ShoppingItem(name: newItemName, isChecked: false)
            items.append(newItem)
            newItemName = ""
            isAddingItem = false
        }
    }

    private func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

struct ShoppingItem: Identifiable {
    var id = UUID()
    var name: String
    var isChecked: Bool
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}

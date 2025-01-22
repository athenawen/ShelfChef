import SwiftUI

struct ListsView: View {
    @State private var userLists: [UserList] = [UserList(name: "Supermarket")]
    @State private var isAddingNewList = false
    @State private var newListName = ""

    var body: some View {
        VStack {
            List {
                ForEach(userLists) { list in
                    NavigationLink(destination: ShoppingListView()) {
                        Text(list.name)
                    }
                }
                .onDelete(perform: deleteList)
            }
            .listStyle(PlainListStyle())
            
            Spacer()
        }
        .navigationTitle("Lists") // Add the title here
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {
                    isAddingNewList = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isAddingNewList) {
            VStack {
                Text("New List Name")
                    .font(.headline)
                
                TextField("Enter List Name", text: $newListName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Button("Cancel") {
                        isAddingNewList = false
                    }
                    .padding()
                    
                    Button("Add List") {
                        addNewList()
                    }
                    .padding()
                    .disabled(newListName.isEmpty)
                }
            }
            .padding()
        }
    }

    private func addNewList() {
        if !newListName.isEmpty {
            let newList = UserList(name: newListName)
            userLists.append(newList)
            newListName = ""
            isAddingNewList = false
        }
    }

    private func deleteList(at offsets: IndexSet) {
        userLists.remove(atOffsets: offsets)
    }
}

struct UserList: Identifiable {
    let id = UUID()
    var name: String
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // Add NavigationView only for preview
            ListsView()
        }
    }
}

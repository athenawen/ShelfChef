import SwiftUI

struct OnboardingView: View {
    @Binding var isFirstLaunch: Bool
    @State private var name: String = ""
    @State private var address: String = ""
    @State private var zipcode: String = ""
    @State private var selectedState: String = ""
    
    // Automatically set the country
    private let selectedCountry: String = "United States of America"
    
    // Arrays for states
    let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]

    // State to control picker sheet presentation
    @State private var isStatePickerPresented = false

    var body: some View {
        VStack {
            Text("Welcome! Please enter your details.")
                .font(.title)
                .padding()

            // Name input
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Address input
            TextField("Enter your address", text: $address)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Zipcode input
            TextField("Enter your zipcode", text: $zipcode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            // State picker disguised as TextField
            Button(action: {
                isStatePickerPresented.toggle()
            }) {
                HStack {
                    Text(selectedState.isEmpty ? "Select your state" : selectedState)
                        .foregroundColor(selectedState.isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
            }
            .padding()

            // Save and continue button
            Button(action: saveUserInfo) {
                Text("Save and Continue")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(name.isEmpty || address.isEmpty || zipcode.isEmpty || selectedState.isEmpty) // Disable the button if fields are empty
        }
        .padding()
        // Sheet for state picker
        .sheet(isPresented: $isStatePickerPresented) {
            VStack {
                Text("Select your State")
                    .font(.headline)
                    .padding()

                Picker("Select your state", selection: $selectedState) {
                    ForEach(states, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()

                Button("Done") {
                    isStatePickerPresented = false
                }
                .padding()
            }
        }
    }

    // Function to save the user's info and mark onboarding as complete
    func saveUserInfo() {
        UserDefaults.standard.set(name, forKey: "userName")
        UserDefaults.standard.set(address, forKey: "userAddress")
        UserDefaults.standard.set(zipcode, forKey: "userZipcode")
        UserDefaults.standard.set(selectedState, forKey: "userState")
        UserDefaults.standard.set(selectedCountry, forKey: "userCountry")
        UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
        isFirstLaunch = false // Navigate to the main tab view after saving info
    }
}

// Preview for the view
struct OnboardingView_Previews: PreviewProvider {
    @State static var isFirstLaunch = true
    
    static var previews: some View {
        OnboardingView(isFirstLaunch: $isFirstLaunch)
    }
}


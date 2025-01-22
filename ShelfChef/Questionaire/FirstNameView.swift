import SwiftUI

struct FirstNameView: View {
    @State private var firstName: String = ""
    @State private var showEmailView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Thank you for choosing to donate! Fill out this form to complete your donation.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .top)
                Spacer()
                VStack(spacing: 20) {
                    Text("Enter your first name")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 25))
                    
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button(action: {
                        if firstName.isEmpty {
                            print("First name is empty")
                        } else {
                            showEmailView = true
                        }
                    }) {
                        Text("Next")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
            }
            .navigationTitle("Donation Form")
            .background(
                NavigationLink(
                    destination: EmailView(firstName: firstName),
                    isActive: $showEmailView
                ) {
                    EmptyView()
                }
            )
        }
    }
}
struct FirstNameView_Previews: PreviewProvider {
    static var previews: some View {
        FirstNameView()
    }
}


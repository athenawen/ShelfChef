import SwiftUI

@main
struct PantryApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        if hasSeenOnboarding {
            MainTabView()
        } else {
            Onboarding()
        }
    }
}

struct Onboarding: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var navigateToMainTabView = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
        
            Text("Welcome to Shelf Chef.\n\nWaste Less, Cook More.")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            Spacer()
            
          
            Button(action: {
                hasSeenOnboarding = true
                navigateToMainTabView = true
            }) {
                Text("Get Started")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .fullScreenCover(isPresented: $navigateToMainTabView) {
                MainTabView()
            }
            
            Spacer()
        }
        .padding()
    }
}


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

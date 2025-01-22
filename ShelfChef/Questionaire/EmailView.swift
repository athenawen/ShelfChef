import SwiftUI

struct EmailView: View {
    var firstName: String
    @State private var email: String = ""
    @State private var isSubmitting: Bool = false
    @State private var isEmailSent: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Enter your Email")
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
                .padding(.horizontal)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .autocorrectionDisabled(true) // Disable autocorrect
                .textInputAutocapitalization(.never) // Disable autocapitalization
            
            Button(action: {
                if email.isEmpty {
                    print("Email is empty")
                } else {
                    isSubmitting = true
                    sendEmailToFoodBank(firstName: firstName, userEmail: email)
                }
            }) {
                Text(isSubmitting ? "Sending..." : "Submit")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isSubmitting ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
    
            if isEmailSent {
                Text("Your donation inquiry has been sent! You should receive an email back within 7 days.")
                    .foregroundColor(.green)
                    .font(.title)
                    .font(.system(size: 2))
            }
        }
        .padding()
    }
    
    func sendEmailToFoodBank(firstName: String, userEmail: String) {
        let apiKey = "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"
        let url = URL(string: "https://api.sendgrid.com/v3/mail/send")!
        
        let emailBody = """
        Hello,

        My name is \(firstName) and I would like to inquire about donating food. My email address is \(userEmail).
        
        Could you please let me know how to proceed with the donation?

        Thank you!
        """
        
        let body: [String: Any] = [
            "personalizations": [
                [
                    "to": [
                        ["email": "vxoletrxsediy@gmail.com"]
                    ],
                    "subject": "Donation Inquiry from \(firstName)"
                ]
            ],
            "from": ["email": userEmail],
            "content": [
                [
                    "type": "text/plain",
                    "value": emailBody
                ]
            ]
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = jsonData
        } catch {
            print("Error serializing JSON body: \(error.localizedDescription)")
            isSubmitting = false
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isSubmitting = false
                if let error = error {
                    print("Error sending email: \(error.localizedDescription)")
                    isEmailSent = false
                    return
                }
                
                if let response = response as? HTTPURLResponse, response.statusCode == 202 {
                    print("Email sent successfully!")
                    isEmailSent = true
                } else {
                    print("Failed to send email. Response: \(String(describing: response))")
                    isEmailSent = false
                }
            }
        }.resume()
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView(firstName: "")
    }
}

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var logoOffset: CGFloat = -50
    @State private var isRegistering = false
    @State private var isLoading = false
    @State private var isLoggedIn = false
    @AppStorage("savedUsername") private var savedUsername = ""
    @AppStorage("savedPassword") private var savedPassword = ""

    var body: some View {
        VStack {
            // LOGO
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.top, 80)
                .offset(y: logoOffset)
                .animation(.easeInOut(duration: 1), value: logoOffset)

            // WELCOME TEXT
            Text("Welcome to ReFab!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            // USERNAME & PASSWORD FIELDS
            VStack(spacing: 15) {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
            }

            Spacer()

            // REGISTER & SIGN IN BUTTONS
            VStack(spacing: 10) {
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.black)
                    Button(action: {
                        isRegistering = true
                    }) {
                        Text("Register")
                            .foregroundColor(.green)
                    }
                }
                
                Button(action: {
                    if username == savedUsername && password == savedPassword {
                        isLoading = true // Show loading screen before navigating to Dashboard
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isLoading = false
                            isLoggedIn = true
                        }
                    } else {
                        print("Invalid credentials")
                    }
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(12)
                        .padding(.horizontal, 50)
                }
            }
            .padding(.bottom, 30)
        }
        .onAppear {
            withAnimation {
                logoOffset = -30
            }
        }
        .fullScreenCover(isPresented: $isRegistering) {
            RegisterView(savedUsername: $savedUsername, savedPassword: $savedPassword)
        }
        .fullScreenCover(isPresented: $isLoading) {
            LoadingView()
        }
        .fullScreenCover(isPresented: $isLoggedIn) {
            DashboardView()
        }
    }
}

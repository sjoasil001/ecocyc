//
//  RegisterView.swift
//  refab
//
//  Created by Sophy Joasil on 2/15/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var username = ""
    @State private var firstName = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @Binding var savedUsername: String
    @Binding var savedPassword: String

    var body: some View {
        VStack {
            Text("Create an Account")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)

            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 40)

            Button(action: {
                savedUsername = username
                savedPassword = password
                print("Account Created")
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Create an Account")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(12)
                    .padding(.horizontal, 50)
            }
            .padding(.top, 20)
        }
    }
}

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .padding()
            
            Text("Sophy")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            HStack(spacing: 30) {
                VStack {
                    Text("120")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Followers")
                        .font(.headline)
                }
                VStack {
                    Text("85")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Following")
                        .font(.headline)
                }
                VStack {
                    Text("10")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Projects")
                        .font(.headline)
                }
            }
            .padding()
            
            HStack(spacing: 20) {
                Button(action: {
                    print("Edit Profile tapped")
                }) {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    print("Add Friends tapped")
                }) {
                    Text("Add Friends")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 20)
            
            // Projects Section
    
            Text("Projects")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 5)
            Divider()
                .padding(.vertical, 10)
            Text("No projects")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 10)
            
            Spacer()
        }
    }
}

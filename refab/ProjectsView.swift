import SwiftUI

struct ProjectsView: View {
    @State private var searchText = "" // State for search bar
    @State private var showCamera = false // State to control camera view
    @State private var capturedImage: UIImage? // Stores captured image
    @State private var showDashboard = false // State to navigate to DashboardView

    var body: some View {
        VStack(alignment: .leading) {
            Text("My Projects")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Search Bar
            TextField("Search projects...", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                
            // Project Containers
            HStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue.opacity(0.2))
                    .frame(height: 150)
                    .overlay(
                        Text("Project 1")
                            .font(.headline)
                    )
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.green.opacity(0.2))
                    .frame(height: 150)
                    .overlay(
                        Text("Project 2")
                            .font(.headline)
                    )
            }
            .padding()
            
            Spacer()
            
            // Bottom Navigation Bar
            HStack {
                Spacer()
                Button(action: { showDashboard.toggle() }) {
                    VStack {
                        Image("2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20) // Shift left
                }
                .fullScreenCover(isPresented: $showDashboard) {
                    DashboardView()
                }
                Spacer()
                Button(action: { print("Projects tapped") }) {
                    VStack {
                        Image("projects")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20) // Shift left
                }
                Spacer()
                Button(action: { showCamera.toggle() }) {
                    VStack {
                        Image("4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20) // Shift left
                }
                .fullScreenCover(isPresented: $showCamera) {
                    CameraView(isPresented: $showCamera, capturedImage: $capturedImage)
                }
                Spacer()
                Button(action: { print("Graph tapped") }) {
                    VStack {
                        Image("6")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20) // Shift left
                }
                Spacer()
                Button(action: { print("Profile tapped") }) {
                    VStack {
                        Image("11")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20) // Shift left
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
        }
        .padding(.leading)
    }
}

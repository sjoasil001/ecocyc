import SwiftUI

struct DashboardView: View {
    @AppStorage("savedUsername") private var savedUsername = "Sophy"
    @State private var savedItems = 15 // Example waste reduction tracking
    @State private var weeklyChallengeGoal = 3
    @State private var weeklyChallengeProgress = 1 // Number of completed upcycles
    @State private var earnedBadge = ""
    @State private var leaderboard = [
        ("Sophy", 150),
        ("Alex", 140),
        ("Jordan", 130),
        ("Chris", 120)
    ]
    @State private var searchText = "" // State for search bar
    @State private var showProjects = false
    @State private var showCamera = false
    @State private var showGraph = false
    @State private var showProfile = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) { // Ensures content stacks properly
                ScrollView {
                    VStack(alignment: .leading) {
                        // User Greeting Section
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.green)

                            VStack(alignment: .leading) {
                                Text("Hi, \(savedUsername)! 🌱")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Ready to upcycle?")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding()

                        VStack {
                            Text("🏆 Weekly Challenge")
                                .font(.headline)
                                .padding(.horizontal)

                            Text("Repurpose 3 plastic bottles this week!")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.horizontal)

                            ProgressView(value: Double(weeklyChallengeProgress), total: Double(weeklyChallengeGoal))
                                .padding(.horizontal)

                            if weeklyChallengeProgress >= weeklyChallengeGoal {
                                Text("🎉 Challenge Completed! Well done! 🎉")
                                    .font(.headline)
                                    .foregroundColor(.green)
                                    .padding()

                                Button("Claim Badge") {
                                    earnedBadge = "Plastic Saver Badge 🏅"
                                }
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            }
                        }
                        .padding()
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(12)

                        if !earnedBadge.isEmpty {
                            Text("🎖 Badge Earned: \(earnedBadge)")
                                .font(.headline)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                        }

                        Text("🏆 Leaderboard")
                            .font(.headline)
                            .padding(.horizontal)

                        VStack {
                            ForEach(leaderboard.indices, id: \.self) { index in
                                HStack {
                                    Text("#\(index + 1)")
                                        .font(.headline)
                                    Text(leaderboard[index].0)
                                        .font(.subheadline)
                                    Spacer()
                                    Text("\(leaderboard[index].1) pts")
                                        .font(.headline)
                                        .foregroundColor(.green)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 3)
                            }
                        }
                        .padding()

                        Text("Trending DIY")
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.top, 10)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(0..<5, id: \.self) { _ in // Now showing 5 containers
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.blue.opacity(0.2))
                                        .frame(width: 100, height: 100)
                                }
                            }
                            .padding(.horizontal)
                        }

                        Text("My Community")
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.top, 10)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(0..<5, id: \.self) { _ in
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.green.opacity(0.2))
                                        .frame(width: 100, height: 100)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 80) // Adds space to prevent overlap with navbar
                }

                // Bottom Navigation Bar (STATIC)
                HStack {
                    Spacer()
                    NavigationLink(destination: DashboardView()) {
                        VStack {
                            Image("2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .offset(x: -20)
                    }
                    Spacer()
                    NavigationLink(destination: ProjectsView()) {
                        VStack {
                            Image("projects")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .offset(x: -20)
                    }
                    Spacer()
                    Button(action: { showCamera.toggle() }) {
                        VStack {
                            Image("4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .offset(x: -20)
                    }
                    .sheet(isPresented: $showCamera) {
                        CameraView(isPresented: $showCamera, capturedImage: .constant(nil))
                    }
                    Spacer()
                    NavigationLink(destination: GraphView()) {
                        VStack {
                            Image("6")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .offset(x: -20)
                    }
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        VStack {
                            Image("11")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .offset(x: -20)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

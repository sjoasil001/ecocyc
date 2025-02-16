import SwiftUI
import Charts

struct GraphView: View {
    @State private var itemsUpcycled = 25
    @State private var co2Saved = 4.2 // kg
    @State private var waterSaved = 8500 // Liters
    @State private var energySaved = 30 // kWh
    @State private var plasticSaved = 12 // Plastic bottles
    @State private var sustainabilityRank = "Green Innovator (Level 4)"
    @State private var showProjects = false
    @State private var showCamera = false
    @State private var showGraph = false
    @State private var showProfile = false
    @State private var showDashboard = false
    
    let weeklyData: [(String, Int)] = [
        ("Mon", 2), ("Tue", 3), ("Wed", 5), ("Thu", 7), ("Fri", 8), ("Sat", 10), ("Sun", 6)
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text("Your Impact")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 40)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    // Line Graph Section
                    Text("Weekly Upcycling Progress")
                        .font(.headline)
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Chart {
                        ForEach(weeklyData, id: \ .0) { day, value in
                            LineMark(
                                x: .value("Day", day),
                                y: .value("Items Upcycled", value)
                            )
                            .foregroundStyle(.green)
                        }
                    }
                    .frame(height: 200)
                    .padding()
                    
                    // Impact Statistics Section
                    VStack(spacing: 20) {
                        StatView(icon: "arrow.up.heart.fill", title: "Items Upcycled", value: "\(itemsUpcycled)", unit: "items")
                        StatView(icon: "leaf.fill", title: "CO₂ Emissions Saved", value: "\(co2Saved)", unit: "kg CO₂")
                        StatView(icon: "drop.fill", title: "Water Saved", value: "\(waterSaved)", unit: "liters")
                        StatView(icon: "bolt.fill", title: "Energy Saved", value: "\(energySaved)", unit: "kWh")
                        StatView(icon: "bag.fill", title: "Plastic Waste Reduced", value: "\(plasticSaved)", unit: "bottles")
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Sustainability Rank
                    Text("🎖 Your Rank: \(sustainabilityRank)")
                        .font(.headline)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    
                    // Learn More Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Learn More")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 20)
                        
                        Text("Why do CO₂, water, and energy savings matter?")
                            .font(.headline)
                        
                        Text("Reducing CO₂ emissions helps slow down climate change and improves air quality.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Saving water is crucial since fresh water is a limited resource, and conserving it helps maintain ecosystems.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Reducing energy consumption decreases reliance on fossil fuels and helps prevent environmental degradation.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                    
                    Spacer()
                        .frame(height: 50)
                }
                .padding()
                .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            
            // Bottom Navigation Bar
            HStack {
                Spacer()
                Button(action: { showDashboard = true }) {
                    VStack {
                        Image("2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20)
                }
                .background(
                    NavigationLink("", destination: DashboardView(), isActive: $showDashboard)
                        .opacity(0)
                )
                Spacer()
                Button(action: { showProjects = true }) {
                    VStack {
                        Image("projects")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20)
                }
                .background(
                    NavigationLink("", destination: ProjectsView(), isActive: $showProjects)
                        .opacity(0)
                )
                Spacer()
                Button(action: { showCamera = true }) {
                    VStack {
                        Image("4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20)
                }
                Spacer()
                Button(action: { showGraph = true }) {
                    VStack {
                        Image("6")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20)
                }
                .background(
                    NavigationLink("", destination: GraphView(), isActive: $showGraph)
                        .opacity(0)
                )
                Spacer()
                Button(action: { showProfile = true }) {
                    VStack {
                        Image("11")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .offset(x: -20)
                }
                .background(
                    NavigationLink("", destination: ProfileView(), isActive: $showProfile)
                        .opacity(0)
                )
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
        }
    }
}


// Helper View for Individual Stats
struct StatView: View {
    var icon: String
    var title: String
    var value: String
    var unit: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.green)
                .font(.title)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text("\(value) \(unit)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

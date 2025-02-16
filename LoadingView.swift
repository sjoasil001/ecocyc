//
//  LoadingView.swift
//  refab
//
//  Created by Sophy Joasil on 2/15/25.
//

import SwiftUI

struct LoadingView: View {
    let funFacts = [
        "Recycling one aluminum can saves enough energy to listen to a full album on your iPod",
        "Recycling plastic saves twice as much energy as burning it in an incinerator",
        "The average person generates over 4 pounds of trash every day",
        "Glass takes at least 4,000 years to decompose in a landfill",
        "91% of plastic is never recycled and ends up in landfills or oceans",
        "Producing one cotton T-shirt takes 2,700 liters of water—enough for one person to drink for 2.5 years!",
        "Over 50 million tons of e-waste are produced annually—more than all commercial airplanes ever built!",
    ]
    
    @State private var randomFact: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            Text(randomFact)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.top, 20)
            
            Spacer()
        }
        .onAppear {
            randomFact = funFacts.randomElement() ?? "Recycling helps save our planet!"
        }
    }
}

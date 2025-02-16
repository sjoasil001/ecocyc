//
//  SplashScreenView.swift
//  refab
//
//  Created by Sophy Joasil on 2/15/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            if isActive {
                LoginView()
            } else {
                VStack {
                    Image("logo2x")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .transition(.opacity)
                    
                    Text("ReFab")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
        .animation(.easeInOut(duration: 1), value: isActive) 
    }
}

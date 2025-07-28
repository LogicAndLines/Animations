//
//  ContentView.swift
//  Animations
//
//  Created by Zeynep Turnalı on 28.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var rotationAmount = 0.0
    
    var body: some View {
        VStack(spacing: 80) {
            Button("Circled") {}
                .padding(50)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .stroke(.red)
                        .scaleEffect(animationAmount)
                        .opacity(2 - animationAmount)
                        .animation(
                            .easeOut(duration: 1)
                            .repeatForever(autoreverses: false),
                            value: animationAmount
                        )
                )
                .onAppear {
                    animationAmount = 2
                }
            
            Button("3D Effect") {
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    rotationAmount += 360
                }
            }
            .padding(50)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(rotationAmount), axis: (x: 1, y: 1, z: 0))
        }
    }
}

#Preview {
    ContentView()
}

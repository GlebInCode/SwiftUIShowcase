//
//  MainMenuView.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 18.12.2024.
//

import SwiftUI

struct MainMenuView: View {
    
    var body: some View {
        NavigationStack {
            Text("SwiftUI")
                .font(.title)
            VStack {
                HStack {
                    NavigationLink(destination: ChallengeView()) {
                        ButtonLabel(text: "Swift Quiz", color: .black)
                    }
                }
                HStack {
                    NavigationLink(destination: TestOne()) {
                        ButtonLabel(text: "Test One", color: .cyan)
                    }
                    NavigationLink(destination: MainAPITest()) {
                        ButtonLabel(text: "Test API", color: .red)
                    }
                }
                HStack {
                    NavigationLink(destination: SwiftUIComponents()) {
                        ButtonLabel(text: "SwiftUI Components", color: .black)
                    }
                }
            }
        }
        .navigationTitle("Main Menu")
    }
}

struct ButtonLabel: View {
    var text: String
    var color: Color
    var body: some View {
        Text(text)
            .font(.title3)
            .foregroundStyle(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .foregroundStyle(color)
            )
    }
}

#Preview {
    MainMenuView()
}

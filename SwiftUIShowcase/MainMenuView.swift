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
            Text("Пробы SwiftUI")
                .font(.title)
            HStack {
                NavigationLink(destination: TestOne()) {
                    ButtonLabel(text: "Test One", color: .cyan)
                }
                NavigationLink(destination: MainAPITest()) {
                    ButtonLabel(text: "Test API", color: .red)
                }
                
            }

        }
    }
}

private struct ButtonLabel: View {
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

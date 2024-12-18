//
//  ContentView.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 18.12.2024.
//

import SwiftUI

struct ContentView: View {

    @State private var counterValue = 0

    var body: some View {
        VStack {
            Text("\(counterValue)")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .frame(width: 80, height: 80)
                .background(
                    Circle()
                        .foregroundStyle(.black)
                )
            Spacer()
                .frame(height: 40)
            HStack {
                Button {
                    // Clean
                    cleanValue()
                } label: {
                    ActionButton(btnTitle: "AC", btnColor: .red)
                }
                Button {
                    // Add one
                    incrementValue()
                } label: {
                    ActionButton(btnTitle: "+ 1", btnColor: .green)
                }
                Button {
                    // Add one
                    decreaseValue()
                } label: {
                    ActionButton(btnTitle: "- 1", btnColor: .yellow)
                }
            }

        }
        .padding()
    }

    private func incrementValue() {
        counterValue += 1
    }

    private func decreaseValue() {
        counterValue -= 1
    }

    private func cleanValue() {
        counterValue = 0
    }
}

struct ActionButton: View {
    let btnTitle: String
    let btnColor: Color
    var body: some View {
        Text(btnTitle)
            .font(.headline)
            .foregroundStyle(.white)
            .frame(width: 80, height: 40)
            .background(
                Capsule()
                    .foregroundStyle(btnColor)
            )
    }
}

#Preview {
    ContentView()
}

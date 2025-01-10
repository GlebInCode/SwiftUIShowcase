//
//  SwiftUIComponents.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 23.12.2024.
//

import SwiftUI

struct SwiftUIComponents: View {

    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink(destination: SwiftUIText()) {
                    ButtonLabel(text: "Text", color: .gray)
                }
                NavigationLink(destination: SwiftUICollections()) {
                    ButtonLabel(text: "Collections", color: .gray)
                }
            }

        }
        .navigationTitle("SwiftUI Components")
    }
}

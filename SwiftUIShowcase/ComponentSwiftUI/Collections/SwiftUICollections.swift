//
//  SwiftUICollections.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 24.12.2024.
//

import SwiftUI

struct SwiftUICollections: View {

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: CollectionDragAndDropView1()) {
                    ButtonLabel(text: "Drag and Drop 1", color: .gray)
                }
                NavigationLink(destination: CollectionDragAndDropView2()) {
                    ButtonLabel(text: "Drag and Drop 2", color: .gray)
                }
            }

        }
        .navigationTitle("SwiftUI Collections")
    }
}

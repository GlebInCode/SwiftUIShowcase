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
            HStack {
                NavigationLink(destination: CollectionDragAndDropView1()) {
                    ButtonLabel(text: "Drag and Drop 1", color: .gray)
                }
            }

        }
        .navigationTitle("SwiftUI Collections")
    }
}

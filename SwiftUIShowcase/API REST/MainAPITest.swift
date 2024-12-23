//
//  MainAPITest.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 19.12.2024.
//

import SwiftUI

struct MainAPITest: View {


    var body: some View {
        NavigationStack {
            NavigationLink {
                UsersView()
            } label: {
                HStack {
                    Text("Users")
                        .font(.headline)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background(Color.blue.opacity(0.1))
            }
            Spacer()
        }
        .navigationTitle("API test")
    }

}



#Preview {
    MainAPITest()
}

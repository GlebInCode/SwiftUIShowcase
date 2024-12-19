//
//  UsersView.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 19.12.2024.
//

import SwiftUI

struct UsersView: View {

    @StateObject var networkManager = NetworkManager.shared

//    @State private var users = [User.user]

    var body: some View {
        NavigationStack {
            ZStack {
                List(networkManager.users, id: \.self) { user in
                    HStack {
                        Text (user.firstName ?? "Nil")
                        Spacer()
                        Text (user.email ?? "Nil")
                    }
                }
            }
        }
        .navigationTitle("Users view")
        .onAppear {
            networkManager.fetchUsers()
        }
    }
}



#Preview {
    UsersView()
}

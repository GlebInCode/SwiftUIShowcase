//
//  UsersView.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 19.12.2024.
//

import SwiftUI

struct UsersView: View {

    @State private var users = [User.user]

    var body: some View {
        NavigationStack {
            ZStack {
                List(users, id: \.self) { user in
                    HStack {
                        Text (user.firstName)
                        Spacer()
                        Text (user.email)
                    }
                }
            }
        }
        .navigationTitle("Users view")
    }
}



#Preview {
    UsersView()
}

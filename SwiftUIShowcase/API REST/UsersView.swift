//
//  UsersView.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 19.12.2024.
//

import SwiftUI

struct UsersView: View {

    @StateObject var networkManager = NetworkManager.shared

    @State private var users = [User]()

    @State private var showProgress = false
    @State private var showError = false
    @State private var errorMessage = ""

    var body: some View {
        NavigationView {
            ZStack {
                List(users, id: \.self) { user in
                    HStack {
                        Text (user.firstName)
                        Spacer()
                        Text (user.email)
                    }
                }
                ProgressView()
                    .progressViewStyle(.circular)
                    .opacity(showProgress ? 1.0 : 0.0)
            }

        }
        .navigationTitle("Users view")
        .alert(isPresented: $showError, content: {
            Alert(title: Text(errorMessage))
        })
        .onAppear {
            showProgress = true
            networkManager.fetchUsers { result in
                showProgress = false
                switch result {
                case .success(let decodedUsers):
                    print("success")
                    users = decodedUsers
                case .failure(let networkError):
                    print("failure \(networkError)")
                    errorMessage = warningMessage(error: networkError)
                    showError = true
                }
            }
        }
    }
}



#Preview {
    UsersView()
}

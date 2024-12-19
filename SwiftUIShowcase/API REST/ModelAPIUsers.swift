//
//  ModelAPIUsers.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 19.12.2024.
//

import Foundation

// MARK: - Welcome
struct PageUsers: Decodable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [User]
}

// MARK: - Datum
struct User: Decodable, Hashable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}

extension User {
    static var user = User(id: 1, email: "gleb19@gmail.com", firstName: "Gleb", lastName: "Khamin", avatar: "url")
}

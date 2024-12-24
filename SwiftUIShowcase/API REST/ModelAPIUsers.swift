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

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

// MARK: - Datum
struct User: Decodable, Hashable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

extension User {
    static var user = User(id: 1, email: "gleb19@gmail.com", firstName: "Gleb", lastName: "Khamin", avatar: "url")
}

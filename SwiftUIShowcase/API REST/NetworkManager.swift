//
//  NetworkManager.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 19.12.2024.
//

import Foundation

enum Link {
    case users

    var url: URL {
        switch self {
        case .users:
            return URL(string: "https://reqres.in/api/users?page=1&per_page=100")!
        }
    }
}

final class NetworkManager: ObservableObject {
    init() {}

    static let shared = NetworkManager()

    @Published var users = [User]()

    func fetchUsers() {
        print("try to fech")

        var fetchRequest = URLRequest(url: Link.users.url)
        fetchRequest.httpMethod = "GET"
        fetchRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: fetchRequest) { (data, response, error) -> Void in
            if error != nil {
                print("Error in session is not nil")
            } else {

                let httpResponse = response as? HTTPURLResponse
                print("Status code: \(String(describing: httpResponse?.statusCode))")

                guard let safeData = data else {
                    print("Error safeData")
                    return
                }

                if let decodedQuery = try? JSONDecoder().decode(PageUsers.self, from: safeData) {
                    DispatchQueue.main.async {
                        self.users = decodedQuery.data
                    }
                } else {
                    print("Error decodedQuery")
                }
            }
        }.resume()
    }
}

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

enum NetworkError: Error {
    case noData
    case tooManyRequests
    case decodingError
}

final class NetworkManager: ObservableObject {
    init() {}

    static let shared = NetworkManager()

    func fetchUsers(completion: @escaping(Result<[User], NetworkError>) -> Void) {
        print("try to fech")

        var fetchRequest = URLRequest(url: Link.users.url)
        fetchRequest.httpMethod = "GET"
        fetchRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: fetchRequest) { (data, response, error) -> Void in
            if error != nil {
                print("Error in session is not nil")
                completion(.failure(.noData))
            } else {

                let httpResponse = response as? HTTPURLResponse
                print("Status code: \(String(describing: httpResponse?.statusCode))")

                if httpResponse?.statusCode != 200 {
                    completion(.failure(.tooManyRequests))
                } else {
                    guard let safeData = data else {
                        print("Error safeData")
                        return
                    }

                    do {
                        let decodedQuery = try JSONDecoder().decode(PageUsers.self, from: safeData)
                        completion(.success(decodedQuery.data))

                    } catch let decodeError {
                        print("Error decodedQuery \(decodeError)")
                        completion(.failure(.decodingError))
                    }
                }
            }
        }.resume()
    }
}

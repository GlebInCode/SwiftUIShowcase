//
//  Helper.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 20.12.2024.
//

import Foundation

func warningMessage(error: NetworkError) -> String {
    switch error {
    case .noData:
        return "Data cannot be found at this URL"
    case .tooManyRequests:
        return "An error occurred while processing the request"
    case .decodingError:
        return "Can't decode data"
    }
}

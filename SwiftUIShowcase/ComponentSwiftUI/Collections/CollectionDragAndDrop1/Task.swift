//
//  Task.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 24.12.2024.
//

import SwiftUI

public struct Task: Identifiable, Hashable {
    public var id: UUID = .init()
    var title: String
    var status: Status
}

public enum Status {
    case todo
    case working
    case completed
}

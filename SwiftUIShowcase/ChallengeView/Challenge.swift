//
//  Challenge.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 26.12.2024.
//

import Foundation

public struct CorrectAnswer: Identifiable, Hashable {
    public var id: UUID = .init()
    var answer: String
}

struct Challenge {
    let id: UUID
    let question: String
    let code: String
    let correctAnswer: [String]
    let optional: [String]
    let explanation: String?
    let clue: String?
}

extension Challenge {
    static var challenge = Challenge(
        id: UUID(),
        question: "Определи порядок выхода принтов",
        code: """
class Animal {
    func sound() {
        print("Animal sound")
    }

    func makeSound() {
        sound()
    }
}

class Dog: Animal {
    override func sound() {
        super.sound()
        print("Woof!")
    }
}

let animal: Animal = Dog()
animal.sound()
animal.makeSound()
""",
        correctAnswer: ["Animal sound","Woof!","Animal sound","Woof!"],
        optional: ["Animal sound","Woof!"],
        explanation: nil,
        clue: nil
    )
}

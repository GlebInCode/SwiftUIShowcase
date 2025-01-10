//
//  ChallengeView.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 25.12.2024.
//

import SwiftUI

struct ChallengeView: View {

    @State private var chellenge: Challenge = Challenge.challenge
    @State private var answer: [CorrectAnswer] = []
    @State private var currentlyDragging: CorrectAnswer?
    @State private var isAnswer: Bool?

    var body: some View {
        NavigationView {
            VStack {
                Text(chellenge.question)
                ScrollView(.vertical) {
                    HStack {
                        Text(chellenge.code)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white, in: .rect(cornerRadius: 10))
                HStack {
                    ScrollView(.vertical) {
                        ForEach(answer) { task in
                            Text(task.answer)
                                .padding(5)
                                .foregroundStyle(Color.white)
                                .background(Color.green, in: .rect(cornerRadius: 10))
                                .contentShape(.dragPreview, .rect(cornerRadius: 10))
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        if let sourceIndex = answer.firstIndex(where: { $0.id == task.id }) {
                                            answer.remove(at: sourceIndex)
                                        }
                                    }
                                }
                                .draggable(task.id.uuidString) {
                                    Text(task.answer)
                                        .padding(5)
                                        .foregroundStyle(Color.white)
                                        .background(Color.green, in: .rect(cornerRadius: 10))
                                        .contentShape(.dragPreview, .rect(cornerRadius: 10))
                                        .onAppear(perform: {
                                            currentlyDragging = task

                                        })
                                }
                                .dropDestination(for: String.self) { items, location in
                                    currentlyDragging = nil
                                    return true
                                } isTargeted: { status in
                                    if let currentlyDragging, status, currentlyDragging.id != task.id {
                                        withAnimation(.snappy) {
                                            if let sourceIndex = answer.firstIndex(where: { $0.id == currentlyDragging.id }),
                                               let destionIndex = answer.firstIndex(where: { $0.id == task.id}) {
                                                print("перемещение из \(sourceIndex) в \(destionIndex)")
                                                let sourceItem = answer.remove(at: sourceIndex)
                                                answer.insert(sourceItem, at: destionIndex)
                                            }
                                        }
                                    }
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(.secondarySystemFill))
                    .padding()
                    ScrollView(.vertical) {
                        ForEach(chellenge.optional , id: \.self) { task in
                            Text(task)
                                .padding(5)
                                .foregroundStyle(Color.white)
                                .background(Color.blue, in: .rect(cornerRadius: 10))
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        answer.append(CorrectAnswer(id: UUID(), answer: task))
                                    }
                                }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(.secondarySystemFill))
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 4)
                Button {
                    checkAnswer()
                } label: {
                    ButtonAnswer(isAnswer: isAnswer)
                }
            }
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
        }
        .navigationTitle("Challenge")
    }
    

    // View для отображения каждого элемента задачи
    private func taskView(_ task: CorrectAnswer) -> some View {
        Text(task.answer)
            .padding(5)
            .foregroundStyle(Color.white)
            .background(Color.green, in: .rect(cornerRadius: 10))
            .contentShape(.dragPreview, .rect(cornerRadius: 10))
    }

    private func checkAnswer() {
        if chellenge.correctAnswer == answer.map({ $0.answer }) {
            isAnswer = true
        } else {
            isAnswer = false
        }
    }
}

private struct ButtonAnswer: View {
    var isAnswer: Bool?
    var body: some View {
        Text(gerLable())
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(
                Capsule()
                    .foregroundStyle(gerColor())
            )
            .padding(.horizontal, 16)
    }

    private func gerLable() -> String {
        switch isAnswer {
        case .some(true):
            "Отлично!"
        case .some(false):
            "Попробуй еще"
        case .none:
            "Проверить"
        }
    }

    private func gerColor() -> Color {
        switch isAnswer {
        case .some(true):
                .green
        case .some(false):
                .red
        case .none:
                .gray
        }
    }
}

#Preview {
    ChallengeView()
}

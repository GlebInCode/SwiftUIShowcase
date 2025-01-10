//
//  CollectionDragAndDropView2.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 25.12.2024.
//

import SwiftUI

struct CollectionDragAndDropView2: View {

    @State private var toDoTasks: [String] = ["@Observable Migration", "Keyframe Animations", "Mograte to Swift Data"]
    @State private var inProgressTasks: [String] = []
    @State private var doneTasks: [String] = []

    var body: some View {
        NavigationView {
            HStack {
                KanbanView(title: "To Do", tasks: toDoTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        withTransaction(Transaction(animation: nil)) {
                            for task in droppedTasks {
                                inProgressTasks.removeAll { $0 == task}
                                doneTasks.removeAll { $0 == task}
                            }
                            if !toDoTasks.contains(droppedTasks) {
                                toDoTasks += droppedTasks
                            }
                        }
                        return true
                    }
                KanbanView(title: "In Progress", tasks: inProgressTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        withTransaction(Transaction(animation: nil)) {
                            for task in droppedTasks {
                                toDoTasks.removeAll { $0 == task}
                                doneTasks.removeAll { $0 == task}
                            }
                            if !inProgressTasks.contains(droppedTasks) {
                                inProgressTasks += droppedTasks
                            }
                        }
                        return true
                    }
                KanbanView(title: "Done", tasks: doneTasks)
                    .dropDestination(for: String.self) { droppedTasks, location in
                        withTransaction(Transaction(animation: nil)) {
                            for task in droppedTasks {
                                toDoTasks.removeAll { $0 == task}
                                inProgressTasks.removeAll { $0 == task}
                            }
                            if !doneTasks.contains(droppedTasks) {
                                doneTasks += droppedTasks
                            }
                        }
                        return true
                    }
            }
            .padding()
        }
        .navigationTitle("Collection Drag And Drop 2")
    }
}

private struct KanbanView: View {

    let title: String
    let tasks: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.footnote.bold())

            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color(.secondarySystemFill))

                VStack(alignment: .leading) {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                            .lineLimit(1)
                            .padding(12)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(8)
                            .shadow(radius: 1, x: 1, y: 1)
                            .padding(2)
                            .draggable(task)
                    }
                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}




#Preview {
    CollectionDragAndDropView2()
}


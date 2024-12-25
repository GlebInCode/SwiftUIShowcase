//
//  CollectionDragAndDropView.swift
//  SwiftUIShowcase
//
//  Created by Глеб Хамин on 24.12.2024.
//

import SwiftUI

struct CollectionDragAndDropView1: View {

    // Sample Tasks

    @State private var todo: [Task] = [
        .init(title: "Edit Video!", status: .todo)
    ]
    @State private var working: [Task] = [
        .init(title: "Record Video", status: .working)
    ]
    @State private var completed: [Task] = [
        .init(title: "Implement Drag & Drop", status: .completed),
        .init(title: "Update Moskview App!", status: .completed)
    ]
    // View Properties
    @State private var currentlyDragging: Task?
    var body: some View {
        NavigationView {
            HStack {
                TodoView()
                WorkingView()
                CompletedView()
            }
        }
        .navigationTitle("Collection Drag And Drop 1")
    }
    // Tasks View
    @ViewBuilder
    func TasksView(_ tasks: [Task]) -> some View {
        VStack(alignment: .leading, spacing: 10, content: {
            ForEach(tasks) { task in
                GeometryReader {
                    // Task Row
                    TaskRow(task, $0.size)
                }
                .frame(height: 45)
            }
            Spacer()
        })
        .frame(maxWidth: .infinity)
        .background(Color(.secondarySystemFill))
        .padding()
    }
    // Task Row
    @ViewBuilder
    func TaskRow(_ task: Task, _ size: CGSize) -> some View {
        Text(task.title)
            .lineLimit(1)
            .padding(.horizontal, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: size.height)
            .background(.white, in: .rect(cornerRadius: 10))
            .contentShape(.dragPreview, .rect(cornerRadius: 10))
            .draggable(task.id.uuidString) {
                Text(task.title)
                    .lineLimit(1)
                    .padding(.horizontal, 5)
                    .frame(width: size.width, height: size.height, alignment: .leading)
                    .background(.red)
                    .contentShape(.dragPreview, .rect(cornerRadius: 10))
                    .onDrag() {
                        switch task.status {
                        case .todo:
                            todo.removeAll(where: { $0.id == task.id })
                            return NSItemProvider(object: task.title as NSItemProviderWriting)
                        case .working:
                            working.removeAll(where: { $0.id == task.id })
                            return NSItemProvider(object: task.title as NSItemProviderWriting)
                        case .completed:
                            completed.removeAll(where: { $0.id == task.id })
                            return NSItemProvider(object: task.title as NSItemProviderWriting)
                        }
                    }
                    .onAppear(perform: {
                        currentlyDragging = task

                    })
            }
            .dropDestination(for: String.self) { items, location in
                currentlyDragging = nil

                return false
            } isTargeted: { status in
                if let currentlyDragging, status, currentlyDragging.id != task.id {
                    withAnimation(.snappy) {
                        // Now let's Implement Cross List Interaction
                        appendTask(task.status)

                        switch task.status {
                        case .todo:
                            replaceItem(tasks: &todo, droppingTask: task, status: .todo)
                        case .working:
                            replaceItem(tasks: &working, droppingTask: task, status: .working)
                        case .completed:
                            replaceItem(tasks: &completed, droppingTask: task, status: .completed)
                        }
                    }
                }
            }
    }
    // Appending And Removing task from one List to another List
    func appendTask(_ status: Status) {
        if let currentlyDragging {
            switch status {
            case .todo:
                // Safe Check and Inserting into List
                if !todo.contains(where: { $0.id == currentlyDragging.id }) {
                    // Updating it's Status
                    var updatedTask = currentlyDragging
                    updatedTask.status = .todo
                    // Adding to the List
                    todo.append(updatedTask)
                    // Removing it from all other Lists
                    working.removeAll(where: { $0.id == currentlyDragging.id })
                    completed.removeAll(where: { $0.id == currentlyDragging.id })

                }
            case .working:
                // Safe Check and Inserting into List
                if !working.contains(where: { $0.id == currentlyDragging.id }) {
                    // Updating it's Status
                    var updatedTask = currentlyDragging
                    updatedTask.status = .working
                    // Adding to the List
                    working.append(updatedTask)
                    // Removing it from all other Lists
                    todo.removeAll(where: { $0.id == currentlyDragging.id })
                    completed.removeAll(where: { $0.id == currentlyDragging.id })

                }
            case .completed:
                // Safe Check and Inserting into List
                if !completed.contains(where: { $0.id == currentlyDragging.id }) {
                    // Updating it's Status
                    var updatedTask = currentlyDragging
                    updatedTask.status = .completed
                    // Adding to the List
                    completed.append(updatedTask)
                    // Removing it from all other Lists
                    working.removeAll(where: { $0.id == currentlyDragging.id })
                    todo.removeAll(where: { $0.id == currentlyDragging.id })

                }
            }
        }
    }
    // Replacing Items Within the List
    func replaceItem(tasks: inout [Task], droppingTask: Task, status: Status) {
        if let currentlyDragging {
            if let sourceIndex = tasks.firstIndex(where: { $0.id == currentlyDragging.id }),
               let destionIndex = tasks.firstIndex(where: { $0.id == droppingTask.id}) {
                // Swapping Item's in the List
                var sourceItem = tasks.remove(at: sourceIndex)
                sourceItem.status = status
                tasks.insert(sourceItem, at: destionIndex)
            }
        }
    }
    // Todo View
    @ViewBuilder
    func TodoView() -> some View {
        VStack {
            Text("Todo")
                .font(.title2)
            ScrollView(.vertical) {
                TasksView(todo)
            }
            .contentShape(.rect)
            .dropDestination(for: String.self) { items, location in
                // Appeding to the last of the Current List, if the item is not present on that List
                withAnimation(.snappy) {
                    appendTask(.todo)
                }
                return false
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
    }
    // Working View
    @ViewBuilder
    func WorkingView() -> some View {
        VStack {
            Text("Working")
                .font(.title2)
            ScrollView(.vertical) {
                TasksView(working)
            }
            .contentShape(.rect)
            .dropDestination(for: String.self) { items, location in
                // Appeding to the last of the Current List, if the item is not present on that List
                withAnimation(.snappy) {
                    appendTask(.working)
                }
                return false
            }
        }
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
    }
    // Completed View
    @ViewBuilder
    func CompletedView() -> some View {
        VStack {
            Text("Completed")
                .font(.title2)
            ScrollView(.vertical) {
                TasksView(completed)
            }
            .contentShape(.rect)
            .dropDestination(for: String.self) { items, location in
                // Appeding to the last of the Current List, if the item is not present on that List
                withAnimation(.snappy) {
                    appendTask(.completed)
                }
                return false
            }
        }
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    CollectionDragAndDropView1()
}

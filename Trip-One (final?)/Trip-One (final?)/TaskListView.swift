//
//  TaskListView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 16/12/24.
//

import SwiftUI

struct TaskListView: View {
    @Binding var toDoItems: [ToDoItem]
    @State private var newTaskTitle: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField("New task", text: $newTaskTitle)
                    .textFieldStyle(.roundedBorder)

                Button(action: addTask) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)

            List {
                ForEach(toDoItems) { item in
                    HStack {
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isCompleted ? .green : .gray)
                            .onTapGesture { toggleCompletion(for: item) }

                        Text(item.title)
                            .strikethrough(item.isCompleted, color: .gray)
                            .foregroundColor(item.isCompleted ? .gray : .primary)

                        Spacer()

                        Button(action: { deleteTask(item) }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
        }
        .navigationTitle("My itinerary")
    }

    private func addTask() {
        guard !newTaskTitle.isEmpty else {
            print("TaskListView: Attempted to add an empty task.")
            return
        }
        let newTask = ToDoItem(title: newTaskTitle)
        toDoItems.append(newTask)
        print("TaskListView: Added new task with title \(newTask.title)")
        newTaskTitle = ""
    }

    private func toggleCompletion(for item: ToDoItem) {
        if let index = toDoItems.firstIndex(where: { $0.id == item.id }) {
            toDoItems[index].isCompleted.toggle()
            print("TaskListView: Task \(toDoItems[index].title) marked as \(toDoItems[index].isCompleted ? "completed" : "incomplete")")
        }
    }

    private func deleteTask(_ item: ToDoItem) {
        if let index = toDoItems.firstIndex(where: { $0.id == item.id }) {
            print("TaskListView: Deleted task with title \(toDoItems[index].title)")
            toDoItems.remove(at: index)
        }
    }
}

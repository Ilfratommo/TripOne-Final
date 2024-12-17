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
                ForEach($toDoItems) { $item in
                    HStack {
                        Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isCompleted ? .green : .gray)
                            .onTapGesture { item.isCompleted.toggle() }

                        Text(item.title)
                            .strikethrough(item.isCompleted, color: .gray)
                            .foregroundColor(item.isCompleted ? .gray : .primary)
                    }
                }
                .onDelete(perform: deleteTask)
            }
        }
        .navigationTitle("Places")
    }

    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        toDoItems.append(ToDoItem(title: newTaskTitle, isCompleted: false))
        newTaskTitle = ""
    }

    private func deleteTask(at offsets: IndexSet) {
        toDoItems.remove(atOffsets: offsets)
    }
}

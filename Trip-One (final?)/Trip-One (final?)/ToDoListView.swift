//
//  ToDoListView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 16/12/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var toDoItems: [ToDoItem] = []

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(value: "TaskList") {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 200, height: 200)
                        .overlay(
                            ActivityRingView(
                                progress: calculateProgress(),
                                ringColor: .blue,
                                completedTasks: toDoItems.filter { $0.isCompleted }.count,
                                totalTasks: toDoItems.count
                            )
                        )
                }
                .buttonStyle(PlainButtonStyle())
                .padding()

                Spacer()
            }
            .navigationTitle("Napoli")
            .navigationDestination(for: String.self) { _ in
                TaskListView(toDoItems: $toDoItems)
            }
        }
    }

    private func calculateProgress() -> Double {
        let completed = toDoItems.filter { $0.isCompleted }.count
        return toDoItems.isEmpty ? 0.0 : Double(completed) / Double(toDoItems.count)
    }
}

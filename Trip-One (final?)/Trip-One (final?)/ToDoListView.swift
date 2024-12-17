//
//  ToDoListView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 16/12/24.
//

import SwiftUI

struct ToDoListView: View {
    @State private var toDoItems: [ToDoItem] = []
    @State private var showTaskList = false
    @State private var subText: String = "Name here the place"
    @State private var isEditingSubText = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 40) {
                // Enlarged and centered subtext
                Text(subText)
                    .font(.title) // Larger font
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                    .onTapGesture {
                        isEditingSubText = true
                    }

                // Enlarged Activity Ring
                NavigationLink(destination: TaskListView(toDoItems: $toDoItems)) {
                    ActivityRingView(
                        progress: calculateProgress(),
                        ringColor: .yellow, // Neon/Fluo yellow
                        ringThickness: 25,   // Thicker ring
                        size: 250,           // Larger size
                        completedTasks: toDoItems.filter { $0.isCompleted }.count,
                        totalTasks: toDoItems.count
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .padding()

                // Achievements Section
                NavigationLink(destination: AchievementsView()) {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 300, height: 200)
                        .overlay(
                            Text("Achievements")
                                .font(.title2)
                                .foregroundColor(.blue)
                                .bold()
                        )
                }
                .buttonStyle(PlainButtonStyle())

                Spacer()
            }
            .navigationTitle("Have a nice Trip")
            .sheet(isPresented: $isEditingSubText) {
                EditSubTextView(subText: $subText)
            }
        }
    }

    private func calculateProgress() -> Double {
        let completed = toDoItems.filter { $0.isCompleted }.count
        let progress = toDoItems.isEmpty ? 0.0 : Double(completed) / Double(toDoItems.count)
        print("ToDoListView: Progress calculated as \(progress)")
        return progress
    }
}

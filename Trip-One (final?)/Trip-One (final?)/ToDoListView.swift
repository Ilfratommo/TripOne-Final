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
    
    @ObservedObject var achievementsManager: AchievementsManager

    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 40) {
                // Enlarged and centered subtext
                Text(subText)
                    .font(.title)
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
                        ringColor: .yellow,
                        ringThickness: 25,
                        size: 250,
                        completedTasks: toDoItems.filter { $0.isCompleted }.count,
                        totalTasks: toDoItems.count
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .padding()

                // Achievements Section
                VStack {
                    Text("Achievements")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(achievementsManager.completedBadges, id: \.self) { badgeName in
                                Image(badgeName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    .frame(height: 120)
                }
                .padding()
                
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
        return progress
    }
}


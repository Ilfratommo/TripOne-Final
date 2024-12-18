//
//  TaskListViewModel.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 18/12/24.
//

/*import SwiftUI

class TaskListViewModel: ObservableObject {
    @Published var toDoItems: [ToDoItem] = []
    @Published var newTaskTitle: String = ""

    func addTask() {
        guard !newTaskTitle.isEmpty else {
            print("TaskListViewModel: Attempted to add an empty task.")
            return
        }
        let newTask = ToDoItem(title: newTaskTitle, isCompleted:)
        toDoItems.append(newTask)
        print("TaskListViewModel: Added new task with title \(newTask.title)")
        newTaskTitle = ""
    }

    func toggleCompletion(for item: ToDoItem) {
        guard let index = toDoItems.firstIndex(where: { $0.id == item.id }) else { return }
        toDoItems[index].isCompleted.toggle()
       // print("TaskListViewModel: Task \(toDoItems[index].title) marked as \(toDoItems[index].isCompleted ? \"completed\" : \"incomplete\")")
    }

    func deleteTask(_ item: ToDoItem) {
        guard let index = toDoItems.firstIndex(where: { $0.id == item.id }) else { return }
        print("TaskListViewModel: Deleted task with title \(toDoItems[index].title)")
        toDoItems.remove(at: index)
    }
 }*/

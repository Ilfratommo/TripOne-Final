//
//  ToDoListView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 16/12/24.
//
import Foundation

class ToDoItem: Identifiable, ObservableObject {
    var id = UUID()
    @Published var title: String
    @Published var isCompleted: Bool

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

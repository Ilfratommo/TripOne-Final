//
//  ToDoListView.swift
//  Trip-One (final?)
//
//  Created by Tommaso D'Auria on 16/12/24.
//

import Foundation

struct ToDoItem: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}

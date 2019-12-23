//
//  TodoReducer.swift
//  TodoAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2019/12/23.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

struct TodoReducer {
    func reducer(oldState: [TodoItem], action: TodoAction) -> [TodoItem] {
        switch action {
        case .addItem(let itemName):
            return self.addNewTodo(oldState: oldState, todoName: itemName)

        case .markCompleted(let id):
            return self.markAsCompleted(oldState: oldState, id: id)

        case .markDeleted(let id):
            return self.markAsDeleted(oldState: oldState, id: id)
        }
    }

    // MARK: - Helper
    private func addNewTodo(oldState: [TodoItem], todoName: String) -> [TodoItem] {
        // Create new todo
        let todo = TodoItem(id: UUID(), todoName: todoName, isCompleted: false, isDeleted: false)

        // Update new todo to list
        var newState = oldState
        newState.append(todo)

        // Return new state list todo
        return newState
    }

    private func markAsCompleted(oldState: [TodoItem], id: UUID) -> [TodoItem] {
        // Search index of id in list
        guard let index = oldState.firstIndex(where: {
            $0.id == id
        }) else {
            return oldState
        }

        // Update completed state
        var todo = oldState[index]
        todo.markCompleted()

        // Update todo to list
        var newState = oldState
        newState[index] = todo
        return newState
    }

    private func markAsDeleted(oldState: [TodoItem], id: UUID) -> [TodoItem] {
        // Search index of id in list
        guard let index = oldState.firstIndex(where: {
            $0.id == id
        }) else {
            return oldState
        }

        // Update deleted state
        var todo = oldState[index]
        todo.markDeleted()

        // Update todo to list
        var newState = oldState
        newState[index] = todo
        return newState
    }
}

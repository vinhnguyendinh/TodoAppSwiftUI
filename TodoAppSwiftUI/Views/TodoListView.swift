//
//  TodoListView.swift
//  TodoAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2019/12/23.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject
    var store: Store

    func deleteItem(at indexSet: IndexSet) {
        // Get index of todo
        guard let index = indexSet.first, index < self.store.state.count else {
            return
        }

        // Get todo with index
        let todo = self.store.state[index]

        // Handle update deleted state
        self.store.dispatch(action: TodoAction.markDeleted(id: todo.id))
    }

    var body: some View {
        List {
            AddTodoView()

            ForEach(self.store.state) { todo in
                NavigationLink(destination: Text(todo.todoName)) {
                    Text(todo.todoName)
                }
            }.onDelete(perform: self.deleteItem)
        }
        .navigationBarTitle("Todos")
        .listStyle(GroupedListStyle())
    }
}

struct TodoListView_Previews: PreviewProvider {
    static let store = Store(state: [])

    static var previews: some View {
        TodoListView().environmentObject(store)
    }
}

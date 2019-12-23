//
//  AddTodoView.swift
//  TodoAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2019/12/23.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct AddTodoView: View {
    @EnvironmentObject
    var store: Store

    @State
    private var todoName = ""

    @State
    private var isAddMode = false

    var body: some View {
        HStack {
            if self.isAddMode {

                TextField("Type here", text: $todoName)
                Button(action: {
                    self.store.dispatch(action: TodoAction.addItem(itemName: self.todoName))

                    self.todoName = ""
                    self.isAddMode = false
                }) {
                    Text("Add")
                }

            } else {

                Button(action: {
                    self.isAddMode = true
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add a todo")
                    }.foregroundColor(.blue)
                }
                
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static let store = Store(state: [])

    static var previews: some View {
        AddTodoView().environmentObject(store)
    }
}

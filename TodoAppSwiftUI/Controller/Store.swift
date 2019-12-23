//
//  Store.swift
//  TodoAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2019/12/23.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import Combine
import SwiftUI

class Store: ObservableObject {
    var objectWillChange = ObservableObjectPublisher()

    private var currentState: [TodoItem]
    private var reducer: TodoReducer

    var state: [TodoItem] {
        return self.currentState
    }

    init(state: [TodoItem]) {
        self.currentState = state
        self.reducer = TodoReducer()
    }

    func dispatch(action: TodoAction) {
        self.currentState = self.reducer.reducer(oldState: self.currentState,
                                                 action: action)

        self.objectWillChange.send()
    }
}

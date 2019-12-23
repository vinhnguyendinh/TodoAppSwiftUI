//
//  TodoItem.swift
//  TodoAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2019/12/23.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

struct TodoItem: Identifiable {
    var id: UUID

    var todoName: String

    var isCompleted: Bool = false

    var isDeleted: Bool = false

    mutating func markCompleted() {
        self.isCompleted = true
    }

    mutating func markDeleted() {
        self.isDeleted = true
    }
}

//
//  TodoAction.swift
//  TodoAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2019/12/23.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import Foundation

enum TodoAction {
    case addItem(itemName: String)
    case markCompleted(id: UUID)
    case markDeleted(id: UUID)
}

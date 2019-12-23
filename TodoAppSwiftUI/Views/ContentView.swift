//
//  ContentView.swift
//  TodoAppSwiftUI
//
//  Created by Vinh Nguyen Dinh on 2019/12/23.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject
    var store: Store

    var body: some View {
        NavigationView {
            TodoListView().environmentObject(store)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let store = Store(state: [])

    static var previews: some View {
        ContentView().environmentObject(store)
    }
}

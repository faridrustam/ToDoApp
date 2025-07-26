//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Farid Rustamov on 24.07.25.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: ToDoViewModel())
        }
    }
}

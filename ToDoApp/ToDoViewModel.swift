//
//  HomeViewModel.swift
//  ToDoApp
//
//  Created by Farid Rustamov on 24.07.25.
//

import Foundation

class ToDoViewModel: ObservableObject {
    
    @Published var toDoList: [String] = []
    @Published var showScreen: Bool = false
    
    func saveToDo(_ item: String) {
        toDoList.append(item)
    }
    
    func activateButton(_ item: String) -> Bool {
        if item.count >= 1 {
            return true
        }
        return false
    }
}

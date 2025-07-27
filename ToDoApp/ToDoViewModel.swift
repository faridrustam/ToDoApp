//
//  HomeViewModel.swift
//  ToDoApp
//
//  Created by Farid Rustamov on 24.07.25.
//

import Foundation

class ToDoViewModel: ObservableObject {
    
    @Published var toDoList: [ToDoModel] = []
    @Published var screenShown: Bool = false
    
    func activateButton(_ item: String) -> Bool {
        if item.count >= 1 {
            return true
        }
        return false
    }
    
    func loadFromCloud() {
        CloudManager.shared.fetchToDos { todos in
            DispatchQueue.main.async {
                self.toDoList = todos
            }
        }
    }
    
    func moveToDo(at source: IndexSet, from destination: Int) {
        toDoList.move(fromOffsets: source, toOffset: destination)
    }
    
    func removeToDo(at offsets: IndexSet) {
        for index in offsets {
            let todo = toDoList[index]
            CloudManager.shared.deleteToDo(todo.id)
        }
    }
}

//
//  CloudManager.swift
//  ToDoApp
//
//  Created by Farid Rustamov on 28.07.25.
//

import Foundation
import FirebaseFirestore

class CloudManager {
    
    static let shared = CloudManager()
    let db = Firestore.firestore()
    
    private init() {}
    
    func addToDoCloud(_ toDo: ToDoModel) {
        db.collection("toDos").document(toDo.id).setData([
            "id": toDo.id,
            "title": toDo.text,
            "isDone": toDo.isDone
        ])
    }
    
    func fetchToDos(completion: @escaping ([ToDoModel]) -> Void) {
        db.collection("toDos").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching todos: \(error.localizedDescription)")
                completion([])
                return
            }

            var fetchedToDos: [ToDoModel] = []
            
            for document in snapshot?.documents ?? [] {
                let data = document.data()
                if let id = data["id"] as? String,
                   let title = data["title"] as? String,
                   let isDone = data["isDone"] as? Bool {
                    let todo = ToDoModel(id: id, text: title, isDone: isDone)
                    fetchedToDos.append(todo)
                }
            }
            completion(fetchedToDos)
        }
    }
    
    func deleteToDo(_ id: String) {
        db.collection("toDos").document(id).delete { error in
            if let error = error {
                print("Error deleting todo: \(error.localizedDescription)")
            } else {
                print("Successfully deleted todo with id: \(id)")
            }
        }
    }
}

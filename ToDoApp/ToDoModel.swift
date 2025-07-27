//
//  ToDoModel.swift
//  ToDoApp
//
//  Created by Farid Rustamov on 27.07.25.
//

import Foundation

struct ToDoModel: Identifiable, Codable, Hashable {
    var id: String = UUID().uuidString
    var text: String
    var isDone: Bool = false
}

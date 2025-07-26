//
//  DismissKeyboard.swift
//  ToDoApp
//
//  Created by Farid Rustamov on 27.07.25.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

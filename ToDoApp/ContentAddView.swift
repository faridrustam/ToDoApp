//
//  ContentAddView.swift
//  ToDoApp
//
//  Created by Farid Rustamov on 25.07.25.
//

import SwiftUI

struct ContentAddView: View {
    
    @ObservedObject var viewModel: ToDoViewModel
    @State var textString: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack() {
                
                TextField("Type what you want to do...", text: $textString)
                    .padding()
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button {
                    if viewModel.activateButton(textString) {
                        viewModel.saveToDo(textString)
                        textString = ""
                    }
                } label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.activateButton(textString) ? Color.blue : Color.gray)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(Text("Create new ToDo"))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentAddView(viewModel: ToDoViewModel())
}

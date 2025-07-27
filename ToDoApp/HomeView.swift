//
//  ContentView.swift
//  ToDoApp
//
//  Created by Farid Rustamov on 24.07.25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: ToDoViewModel
    
    var body: some View {
        NavigationView {
            VStack() {
                List {
                    ForEach(viewModel.toDoList, id: \.self) { item in
                        Text(item.text)
                    }.onDelete { offsets in
                        viewModel.removeToDo(at: offsets)
                    }
                }
            }.navigationTitle(Text("Your ToDos"))
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar(content: {
                    ToolbarItem(placement: ToolbarItemPlacement.topBarLeading, content: {
                        EditButton()
                    })
                    ToolbarItem(placement: ToolbarItemPlacement.topBarTrailing, content: {
                        Button("Add") {
                            viewModel.screenShown.toggle()
                        }.sheet(isPresented: $viewModel.screenShown) {
                            ContentAddView(viewModel: viewModel)
                        }
                    })
                })
        }.onAppear {
            viewModel.loadFromCloud()
        }
    }
}

#Preview {
    HomeView(viewModel: ToDoViewModel())
}

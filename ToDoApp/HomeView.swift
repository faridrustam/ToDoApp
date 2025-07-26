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
                        Text(item)
                    }.onDelete { offsets in
                        viewModel.toDoList.remove(atOffsets: offsets)
                    }
                    .onMove { (source, destination) in
                        viewModel.toDoList.move(fromOffsets: source, toOffset: destination)
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
                            viewModel.showScreen.toggle()
                        }.sheet(isPresented: $viewModel.showScreen) {
                            ContentAddView(viewModel: viewModel)
                        }
                    })
                })
        }
    }
}

#Preview {
    HomeView(viewModel: ToDoViewModel())
}

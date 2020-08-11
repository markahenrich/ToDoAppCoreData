//
//  ContentView.swift
//  ToDoApp+CoreData
//
//  Created by Mark Henrich on 8/10/20.
//  Copyright © 2020 Mark Henrich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tasksVM: TaskListViewModel
    @State private var isPresented = false
    
    init() {
        self.tasksVM = TaskListViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasksVM.tasks) { task in
                        HStack {
                            Text("\(task.title)")
                            Spacer()
                            Button("Delete") {
                                CoreDataManager.shared.deleteTask(id: task.id)
                                self.tasksVM.getAllTasks()
                            }
                            .foregroundColor(.red)
                        }
                    }.onDelete(perform: deleteRow)
                }
                
                Button("Add Task") {
                    self.isPresented = true
                }.padding()
            }
            .navigationBarTitle("To Do")
            .sheet(isPresented: $isPresented, onDismiss: { self.tasksVM.getAllTasks() }, content: {
                AddTaskView()
            })
        }
    }
    
    func deleteRow(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = self.tasksVM.tasks[index]
            self.tasksVM.deleteTask(task)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

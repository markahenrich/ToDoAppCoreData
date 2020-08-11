//
//  TaskListViewModel.swift
//  ToDoApp+CoreData
//
//  Created by Mark Henrich on 8/10/20.
//  Copyright © 2020 Mark Henrich. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class TaskListViewModel: ObservableObject {
    @Published var tasks = [TaskViewModel]()
    
    init() {
        getAllTasks()
    }
    
    func getAllTasks() {
        self.tasks = CoreDataManager.shared.fetchAllTasks().map({ TaskViewModel(task: $0) })
    }
    
    func deleteTask(_ taskVM: TaskViewModel) {
        CoreDataManager.shared.deleteTask(id: taskVM.id)
        getAllTasks()
    }
}

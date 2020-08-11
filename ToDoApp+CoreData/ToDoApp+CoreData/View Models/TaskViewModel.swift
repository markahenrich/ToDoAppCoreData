//
//  TaskViewModel.swift
//  ToDoApp+CoreData
//
//  Created by Mark Henrich on 8/10/20.
//  Copyright © 2020 Mark Henrich. All rights reserved.
//

import Foundation

struct TaskViewModel: Identifiable {
    let task: Task
    
    var id: UUID {
        task.id = UUID()
        return task.id
    }
    
    var title: String {
        guard let title = self.task.title else { return "no title"}
        return title
    }
}

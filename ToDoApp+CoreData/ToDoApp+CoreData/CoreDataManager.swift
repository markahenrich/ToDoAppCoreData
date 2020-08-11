//
//  CoreDataManager.swift
//  ToDoApp+CoreData
//
//  Created by Mark Henrich on 8/10/20.
//  Copyright © 2020 Mark Henrich. All rights reserved.
//

import Foundation
import CoreData
import UIKit

// This extension grabs the moc from AppDelegate
extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

// This class gives you a single place in your app to access core data.
class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func fetchAllTasks() -> [Task] {
        
        var tasks = [Task]()
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        // Create a predicate to filter results, if desired.
        //fetchRequest.predicate = NSPredicate(format: "name == %@", "Name")
         
        
        do {
            tasks = try self.moc.fetch(fetchRequest)
        } catch {
            // handle error
        }
        
        return tasks
    }
    
    func fetchTask(id: UUID) -> Task? {
        var tasks = [Task]()
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
           tasks = try self.moc.fetch(fetchRequest)
        } catch {
            print("error fetching request")
        }
        
        return tasks.first
    }
    
    func saveTask(title: String) {
        let task = Task(context: self.moc)
        task.id = UUID()
        task.title = title
        
        try? self.moc.save()
    }
    
    func deleteTask(id: UUID) {
        
        do {
            if let task = fetchTask(id: id) {
                self.moc.delete(task)
                try? self.moc.save()
            }
        }
    }
}

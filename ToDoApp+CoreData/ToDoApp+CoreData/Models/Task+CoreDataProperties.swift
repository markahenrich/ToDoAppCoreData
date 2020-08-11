//
//  Task+CoreDataProperties.swift
//  ToDoApp+CoreData
//
//  Created by Mark Henrich on 8/10/20.
//  Copyright © 2020 Mark Henrich. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID
    @NSManaged public var title: String?
}

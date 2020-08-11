//
//  AddTaskView.swift
//  ToDoApp+CoreData
//
//  Created by Mark Henrich on 8/10/20.
//  Copyright © 2020 Mark Henrich. All rights reserved.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    
    var body: some View {
        VStack {
            TextField("Task Title", text: $title)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                CoreDataManager.shared.saveTask(title: self.title)
                
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

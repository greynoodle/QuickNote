//
//  Controller.swift
//  QuickNote
//
//  Created by Yusif Tijani on 12/27/22.
//

import Foundation
import CoreData

class Controller: ObservableObject {
    let container = NSPersistentContainer(name: "QuickNote")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load data: \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved :)")
        } catch {
            print("Failed to save data :(")
        }
    }
    
    func addFolder(name: String, date: Date, context: NSManagedObjectContext) {
        let folder = Folder(context: context)
        folder.id = UUID()
        folder.name = name
        folder.date = Date()
        
        save(context: context)
    }
    
    func editNotes(folder: Folder, notes: String, context: NSManagedObjectContext) {
        folder.notes = notes
        folder.date = Date()
        
        save(context: context)
    }
}

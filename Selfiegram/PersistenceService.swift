//
//  PersistenceService.swift
//  Selfiegram
//
//  Created by Trant Solo on 05.10.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import Foundation
import CoreData

class PersistenceService {
    
    private init() {}
    
    static let context = persistentContainer.viewContext
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Selfiegram")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

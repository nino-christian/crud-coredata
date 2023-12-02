//
//  CoreDataManager.swift
//  crud-with-core-data
//
//  Created by DNA-User on 12/1/23.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "crud_with_core_data")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // TODO: - Do Crash Logics
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: - Do Crash Logics
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

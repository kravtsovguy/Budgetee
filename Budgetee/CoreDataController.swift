//
//  CoreDataController.swift
//  Budgetee
//
//  Created by Matvey Kravtsov on 10/06/2018.
//  Copyright © 2018 Kravtsov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataController {

    static let shared = CoreDataController()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Budgetee")
        container.loadPersistentStores(completionHandler: { (_, error) in
        })
        return container
    }()

    lazy var managedContext: NSManagedObjectContext = persistentContainer.viewContext

    func saveContext() {
        if managedContext.hasChanges {
            try? managedContext.save()
        }
    }
}

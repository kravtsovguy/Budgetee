//
//  Category+CoreDataClass.swift
//  Budgetee
//
//  Created by Matvey Kravtsov on 10/06/2018.
//  Copyright © 2018 Kravtsov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    public static var fetchRequest = NSFetchRequest<Category>(entityName: "Category")
}

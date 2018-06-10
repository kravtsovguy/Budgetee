//
//  Category+CoreDataProperties.swift
//  Budgetee
//
//  Created by Matvey Kravtsov on 10/06/2018.
//  Copyright © 2018 Kravtsov. All rights reserved.
//
//

import Foundation
import CoreData

extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var rootCategory: Category?

}

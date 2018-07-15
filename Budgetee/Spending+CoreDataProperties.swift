//
//  Spending+CoreDataProperties.swift
//  Budgetee
//
//  Created by Matvey Kravtsov on 10/06/2018.
//  Copyright © 2018 Kravtsov. All rights reserved.
//
//

import Foundation
import CoreData

extension Spending {
    @NSManaged public var cost: Float
    @NSManaged public var date: NSDate
    @NSManaged public var category: Category
}

//
//  Item+CoreDataProperties.swift
//  Dreamlist
//
//  Created by Loyd Vallot on 6/16/17.
//  Copyright © 2017 Loyd's Productions. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: Double
    @NSManaged public var created: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?

}

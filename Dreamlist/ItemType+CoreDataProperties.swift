//
//  ItemType+CoreDataProperties.swift
//  Dreamlist
//
//  Created by Loyd Vallot on 6/16/17.
//  Copyright © 2017 Loyd's Productions. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}

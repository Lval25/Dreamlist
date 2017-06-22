//
//  Item+CoreDataClass.swift
//  Dreamlist
//
//  Created by Loyd Vallot on 6/16/17.
//  Copyright © 2017 Loyd's Productions. All rights reserved.
//

import Foundation
import CoreData

//@objc(Item)
public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        //time stamp for items
        
        self.created = NSDate()
    }

}

//
//  Itemcell.swift
//  Dreamlist
//
//  Created by Loyd Vallot on 6/17/17.
//  Copyright © 2017 Loyd's Productions. All rights reserved.
//

import UIKit

class Itemcell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    
    func configureCell(item: Item)
    {
        title.text = item.title
        price.text = "$\(item.price)"
        details.text = item.details
        
    }
   
}

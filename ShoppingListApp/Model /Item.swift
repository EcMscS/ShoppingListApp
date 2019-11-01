//
//  Item.swift
//  ShoppingListApp
//
//  Created by Jeffrey Lai on 11/1/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class Item {
    
    var price: Double
    var name: String
    var description: String
    
    init(itemPrice: Double, itemName: String, itemDescription: String) {
        price = itemPrice
        name = itemName
        description = itemDescription
    }
    
}

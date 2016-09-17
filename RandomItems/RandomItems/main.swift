//
//  main.swift
//  RandomItems
//
//  Created by Zhang, Jie on 8/21/16.
//  Copyright © 2016 Jie Zhang. All rights reserved.
//

import Foundation

var itemArray: [BNRItem] = []


for i in 1...10 {
    itemArray.append(BNRItem.randomItem())
}


for item in itemArray {
    NSLog("%@", item)
}

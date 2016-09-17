//
//  BNRItem.swift
//  RandomItems
//
//  Created by Zhang, Jie on 8/21/16.
//  Copyright © 2016 Jie Zhang. All rights reserved.
//

import Foundation

class BNRItem: NSObject {
    var _itemName: String
    var _serialNumber: String
    var _valueInDollars: Int
    var _dateCreated: NSDate
    
    static func randomItem() -> BNRItem {
        let randomAdjectiveList = ["Fluffy", "Rusty", "Shiny"]
        let randomNounList = ["Bear", "Spork", "Mac"]
        
        let adjectiveIndex = Int(arc4random_uniform(UInt32(randomAdjectiveList.count)))
        let nounIndex = Int(arc4random_uniform(UInt32(randomNounList.count)))
        
        let name = "\(randomAdjectiveList[adjectiveIndex]) \(randomNounList[nounIndex])"
        let dollars = Int(arc4random_uniform(100))
        let randomSerialNumner = "0\(arc4random()%10)A\(arc4random()%26)0\(arc4random()%10)A\(arc4random()%26)0\(arc4random()%10)"
        
        return BNRItem(name: name, number: randomSerialNumner, dollars: dollars)
        
    }
    
    override convenience init() {
        self.init(name: "", number: "", dollars: 0)
    }
    
    convenience init(name: String) {
        self.init(name: name, number: "", dollars: 0)
    }
    
    convenience init(name: String, number: String) {
        self.init(name: name, number: number, dollars: 0)
    }
    
    init(name: String, number: String, dollars: Int) {
        _itemName = name
        _serialNumber = number
        _valueInDollars = dollars
        _dateCreated = NSDate()
        super.init()
    }
    
    override var description: String {
        return "\(_itemName);\(_dateCreated);\(_serialNumber);\(_valueInDollars);"
    }
    
    
    
    
}

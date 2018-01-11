//
//  Player.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 6/3/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit

class Player: NSObject, NSCoding {
    
    var name:String!
    var highScore:Int!
    
    init(name:String,highScore:Int) {
        self.name=name
        self.highScore=highScore
    }
   
   
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(highScore, forKey: "highScore")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.highScore = aDecoder.decodeObject(forKey: "highScore") as? Int
    }
    
    
    
    
    

}

//
//  Question.swift
//  Quizo
//
//  Created by Ahsan Lakhani on 6/3/17.
//  Copyright © 2017 Ahsan Lakhani. All rights reserved.
//

import UIKit

class Question: NSObject {
    
    var question:String!
    var options:[String]!
    var answer:String!
    
    init(question:String,options:[String],answer:String) {
        self.question=question
        self.options=options
        self.answer=answer
    }
    
    

}

//
//  Plan.swift
//  PlansPop
//
//  Created by Aplimovil on 12/11/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation
import Parse

struct Plan{
    
    var title:String!
    var descripcion:String!
    var date:String!
    var hour:String!
    var place:String!
    var assist:Int32!
    var image:PFFile!
    
    init (title:String, descripcion:String, date:String, place:String, image:PFFile, assist:Int32) {
        
        self.title = title
        self.descripcion = descripcion
        self.date = date
        self.image = image
        self.place = place
        self.assist = assist
        
        
    }
    init(){}
    
    
}
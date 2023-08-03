//
//  Character.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 17/07/2023.
//

import Foundation

class UserCharacter{
    var id: String = UUID().uuidString
    var name:String
    var profile:Int
    var lifePoint = 100
    var isLiving = true
    
    init(name:String, profile:Int){
        self.name=name
        self.profile=profile
    }
    
    
    
    
}

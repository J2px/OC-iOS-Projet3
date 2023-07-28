//
//  Character.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 17/07/2023.
//

import Foundation

class UserCharacter{
    var id:Int
    var name:String
    var profile:Int
    var lifePoint=100
    var isLiving=true
    
    init(id:Int, name:String, profile:Int){
        self.id=id
        self.name=name
        self.profile=profile
        
    }
    
    func verifyIfIsLiving(lifePoint:Int)->Bool{
        if(lifePoint==0){
             isLiving = false
        }else{
             isLiving = true
            
        }
        
        return isLiving
    }
    
    
    
    
}

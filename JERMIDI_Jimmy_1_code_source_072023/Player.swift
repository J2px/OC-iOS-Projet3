//
//  Player.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 17/07/2023.
//

import Foundation

class Player{
    var id=0
    var teamName=" "
    
    
    func createUserCharacter(id: Int,name:String, profile:Int)-> UserCharacter {
            let character = UserCharacter(id:id ,name:name , profile:profile)

            return character
    }
    
    
    func attack(){
        
        
    }
    
    func care(){
        
        
    }
    
    
    
    
    
    
}

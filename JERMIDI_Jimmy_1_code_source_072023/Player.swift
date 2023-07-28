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
    var userCharacters: [UserCharacter] = []
    
    
    func createUserCharacter(id: Int,name:String, profile:Int){
            let character = UserCharacter(id:id ,name:name , profile:profile)

        userCharacters.append(character)
    }
    
    
    
    func attack(choice:Int, currentCharacter: UserCharacter)->Int{
        var hit:Int=0
        switch(choice){
        case 1:
            let sword = Sword(hit: hit)
            sword.hit=hit
            switch(currentCharacter.profile){
                case 1:
                    hit=30
                case 2:
                    hit=20
                case 3:
                    hit=10
                case 4:
                    hit=40
            default:
                hit=0
            }
        case 2:
            let spear = Spear(hit: hit)
            spear.hit=hit
            switch(currentCharacter.profile){
                case 1:
                    hit=30
                case 2:
                    hit=20
                case 3:
                    hit=10
                case 4:
                    hit=40
            default:
                hit=0
            }
        case 3:
            let spear = Spear(hit: hit)
            spear.hit=hit
            switch(currentCharacter.profile){
                case 1:
                    hit=30
                case 2:
                    hit=20
                case 3:
                    hit=10
                case 4:
                    hit=40
            default:
                hit=0
            }
        default:
            hit=0
        }
            
        return hit
            
            
        
        
        
    }
    
    func care(choice:Int){
        
        
    }
    
    
    
    
    
    
}

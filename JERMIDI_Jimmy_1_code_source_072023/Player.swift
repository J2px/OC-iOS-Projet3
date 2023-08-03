//
//  Player.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 17/07/2023.
//

import Foundation

class Player{
    var id: String = UUID().uuidString
    var teamName = ""
    var userCharacters: [UserCharacter] = []
    var deadCharacters: [UserCharacter] = []
    
    /// This function is used to create a character and add it to an array
    func createUserCharacter(id:Int, name:String, profile:Int){
        let character = UserCharacter(id: id,name: name , profile: profile)
        userCharacters.append(character)
    }
    
    func isAlive() -> Bool {
        /// Loop on all characters and check if all characters are dead
        userCharacters.filter({ $0.isLiving }).count != 0
    }
    
    /// This function is used to make a choice for an action (attack or care)
    func attack(choice:Int, currentCharacter: UserCharacter)->Int{
        var hit:Int=0
        switch(choice){
        case 1:
            let sword = Sword(hit: hit)
            sword.hit=hit
            switch(currentCharacter.profile){
                case 1:
                    hit=25
                case 2:
                    hit=20
                case 3:
                    hit=30
                case 4:
                    hit=15
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
                    hit=35
                case 3:
                    hit=40
                case 4:
                    hit=30
            default:
                hit=0
            }
        case 3:
            let knife = Knife(hit: hit)
            knife.hit=hit
            switch(currentCharacter.profile){
                case 1:
                    hit=20
                case 2:
                    hit=15
                case 3:
                    hit=25
                case 4:
                    hit=10
            default:
                hit=0
            }
        default:
            hit=0
        }
            
        return hit
    }
    
}

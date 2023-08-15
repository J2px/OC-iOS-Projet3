///
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
    func createUserCharacter(id: Int, name: String, profile: Character){
        let character = UserCharacter(id: id,name: name , profile: profile)
        userCharacters.append(character)
    }
    
    func isAlive() -> Bool {
        /// Loop on all characters and check if all characters are dead
        userCharacters.filter({ $0.isLiving }).count != 0
    }
    
    /// This function is used to make a choice for an action (attack or care)
    func attack(weaponChoice: Int, currentCharacter: UserCharacter) -> Int {
        var hit:Int=0
        switch(weaponChoice){
        // Sword
        case 1:
            let sword = Sword(hit: hit)
            sword.hit=hit
            switch(currentCharacter.profile) {
            case .warrior:
                hit = 25
            case .magus:
                hit = 20
            case .colossus:
                hit = 30
            case .dwarf:
                hit = 15
            }
        case 2:
            // Spear
            let spear = Spear(hit: hit)
            spear.hit=hit
            switch(currentCharacter.profile){
                case .warrior:
                    hit=30
                case .magus:
                    hit=35
                case .colossus:
                    hit=40
                case .dwarf:
                    hit=30
            }
        case 3:
            // Knife
            let knife = Knife(hit: hit)
            knife.hit=hit
            switch(currentCharacter.profile){
                case .warrior:
                    hit=20
                case .magus:
                    hit=15
                case .colossus:
                    hit=25
                case .dwarf:
                    hit=10
            }
        default:
            hit=0
        }
            
        return hit
    }
    
    
    func care(currentCharacter: UserCharacter) {
            let caringAmount: Int

            switch currentCharacter.profile {
                case .warrior:
                    caringAmount = 15
                case .magus:
                    caringAmount = 5
                case .colossus:
                    caringAmount = 10
                case .dwarf:
                    caringAmount = 5
            }

            currentCharacter.lifePoint += caringAmount
        }
}

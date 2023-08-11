//
//  Character.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 17/07/2023.
//

import Foundation

enum Character: Int {
    case warrior = 1,
         magus = 2,
         colossus = 3,
         dwarf = 4
    
    var description: String {
        switch self {
        case .warrior:
            return "I am a warrior"
        case .magus:
            return "I am Magus"
        case .colossus:
            return "I am Colossus"
        case .dwarf:
            return "I am Dwarf"
        }
    }
}

class UserCharacter{
    var id: Int
    var name: String
    var profile: Character
    var lifePoint = 100
    var isLiving = true
    
    init(id: Int, name: String, profile: Character){
        self.id=id
        self.name=name
        self.profile=profile
    }
    
}

//
//  Weapon.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 20/07/2023.
//

import Foundation


class Weapon {
    var hit: Int
    
    init(hit: Int) {
        self.hit = hit
    }
}

class Sword: Weapon {
    override init(hit: Int) {
        super.init(hit: hit)
    }
}

class Spear: Weapon {
    override init(hit: Int) {
        super.init(hit: hit)
    }
}

class Knife: Weapon {
    override init(hit: Int) {
        super.init(hit: hit)
    }
}

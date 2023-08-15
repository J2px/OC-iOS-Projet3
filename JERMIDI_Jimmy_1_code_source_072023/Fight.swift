//
//  Fight.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 25/07/2023.
//

import Foundation

class Fight {
    
    var winnerTeamId = 0
    var maxCharacters = 0
    
    init(maxCharacters: Int) {
        self.maxCharacters = maxCharacters
    }
    
    
    /// Start the fight between two players and returns the dead character
    func start(player1: Player, player2: Player) -> (Int) {
        var currentCharacter1: UserCharacter!
        var currentCharacter2: UserCharacter!
        
        /// Player 1: fighter selection
        
        print("Joueur 1")
        print("Veuillez sélectionner votre combattant")
        for userCharacter in player1.userCharacters {
            if (userCharacter.isLiving) {
                print("Nom -> \(userCharacter.name), Profile -> \(userCharacter.profile) Tapez \(userCharacter.id)")
            }
        }
        
        var charInput1: Int?

        while true {
            if let curCharInput1 = readLine(), !curCharInput1.isEmpty, let inputInt = Int(curCharInput1), (1...maxCharacters).contains(inputInt) {
                charInput1 = inputInt
                break
            } else {
                print("Veuillez saisir un nombre entre 1 et \(maxCharacters).")
            }
        }

        if let charInput1 = charInput1 {
            currentCharacter1 = selectFighter(choice: charInput1, player: player1)
        }
        
        /// Player 2: fighter selection
        
        print("Joueur 2")
        print("Veuillez sélectionner votre combattant")
        for userCharacter in player2.userCharacters {
            if(userCharacter.isLiving==true){
                print("Nom -> \(userCharacter.name), Profile -> \(userCharacter.profile) Tapez \(userCharacter.id)")
            }
        }
        var charInput2: Int?

        while true {
            if let curCharInput2 = readLine(), !curCharInput2.isEmpty, let inputInt = Int(curCharInput2), (1...maxCharacters).contains(inputInt) {
                charInput2 = inputInt
                break
            } else {
                print("Veuillez saisir un nombre entre 1 et \(maxCharacters).")
            }
        }

        if let charInput2 = charInput2 {
            currentCharacter2 = selectFighter(choice: charInput2, player: player2)
        }
        
        var p1lifePoints = currentCharacter1?.lifePoint ?? 0
        var p2lifePoints = currentCharacter2?.lifePoint ?? 0

        /// Fight result
        
        while p1lifePoints > 0 && p2lifePoints > 0 {
            /// Player 1: weapon selection
            print("Pour \(currentCharacter1!.name)")
            print("Veuillez saisir une action:")
            print("Attaque à l'épée   -> Tapez 1")
            print("Attaque à la lance -> Tapez 2")
            print("Attaque au couteau -> Tapez 3")
            print("Soin               -> Tapez 4")
            var actionInput1: Int?

            while actionInput1 == nil {
                if let input1 = readLine(), !input1.isEmpty, let inputInt = Int(input1), (1...4).contains(inputInt) {
                    actionInput1 = inputInt
                } else {
                    print("Veuillez saisir un nombre compris entre 1 et 4.")
                }
            }

            if let actionInput1 = actionInput1 {
                if actionInput1 == 4 {
                            player1.care(currentCharacter: currentCharacter1)
                        } else {
                        let player1hit = player1.attack(weaponChoice: actionInput1, currentCharacter: currentCharacter1!)
                p2lifePoints -= player1hit
                }
            }

            /// Player 2: weapon selection
            print("Pour \(currentCharacter2!.name)")
            print("Veuillez saisir une action:")
            print("Attaque à l'épée   -> Tapez 1")
            print("Attaque à la lance -> Tapez 2")
            print("Attaque au couteau -> Tapez 3")
            print("Soin               -> Tapez 4")
            var actionInput2: Int?

            while actionInput2 == nil {
                if let input2 = readLine(),!input2.isEmpty, let inputInt = Int(input2), (1...4).contains(inputInt) {
                    actionInput2 = inputInt
                } else {
                    print("Veuillez saisir un nombre compris entre 1 et 4.")
                }
            }

            if let actionInput2 = actionInput2 {
                if actionInput2 == 4 {
                    player2.care(currentCharacter: currentCharacter2)
                    } else {
                    let player2hit = player2.attack(weaponChoice: actionInput2, currentCharacter: currentCharacter2!)
                p1lifePoints -= player2hit
                }
            }
            
            
            /// Fight result
            print("\(currentCharacter1!.name) a \(p1lifePoints) points")
            print("\(currentCharacter2!.name) a \(p2lifePoints) points")
            
        }

        
        let isOverResult = isOver(p1lifePoints: p1lifePoints, p2lifePoints: p2lifePoints)
        
        print("Le combat est terminé, isOver: \(isOverResult)")
        
        if p1lifePoints < p2lifePoints {
            winnerTeamId = 2
            currentCharacter1.isLiving=false
            player1.deadCharacters.append(currentCharacter1)
        } else if p2lifePoints < p1lifePoints {
            winnerTeamId = 1
            currentCharacter2.isLiving=false
            player2.deadCharacters.append(currentCharacter2)
        } else {
            winnerTeamId = 0
        }
        
    return winnerTeamId
        
    }

    /// This function return a value to select a fighter for a fight
    func selectFighter(choice: Int, player: Player) -> UserCharacter? {
        guard choice > 0 && choice <= player.userCharacters.count else {
            return nil
        }
        return player.userCharacters[choice - 1]
    }

    func isOver(p1lifePoints: Int, p2lifePoints: Int) -> Bool {
        return p1lifePoints <= 0 || p2lifePoints <= 0
    }
    
    
    
    
}

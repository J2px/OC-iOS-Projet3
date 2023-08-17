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
        var currentCharacter1: UserCharacter?
        var currentCharacter2: UserCharacter?
        
        /// Player 1: fighter selection
        print("Joueur 1")
        print("Veuillez sélectionner votre combattant")
        showFighters(player: player1)
        currentCharacter1 = chooseFighter(player: player1)
        
        /// Player 2: fighter selection
        
        print("Joueur 2")
        print("Veuillez sélectionner votre combattant")
        showFighters(player: player2)
        currentCharacter2 = chooseFighter(player: player2)
        
        var p1lifePoints = currentCharacter1?.lifePoint ?? 0
        var p2lifePoints = currentCharacter2?.lifePoint ?? 0
        
        let currentCharacterName1 = currentCharacter1?.name
        let currentCharacterName2 = currentCharacter2?.name

        if let currentCharacter1 = currentCharacter1, let currentCharacter2 = currentCharacter2, let currentCharacterName1 = currentCharacterName1, let currentCharacterName2 = currentCharacterName2 {
            while(p1lifePoints>0 && p2lifePoints>0){
                print("Pour \(String(describing: currentCharacterName1))")
                showAction()
                p1lifePoints = selectAction(attacker: player1, opponent: player2, attackCharacter: currentCharacter1, defenseCharacter: currentCharacter2)
                if p2lifePoints <= 0 {
                        break
                    }
                print("Pour \(String(describing: currentCharacterName2))")
                showAction()
                p2lifePoints = selectAction(attacker: player2, opponent: player1, attackCharacter: currentCharacter2, defenseCharacter: currentCharacter1)
                if p1lifePoints <= 0 {
                        break
                    }
                showFightPoints(currentCharacterName1: currentCharacterName1, currentCharacterName2: currentCharacterName2, p1Points:p1lifePoints, p2Points: p2lifePoints)
                
            }
        }
       
        
        let isOverResult = isOver(p1lifePoints: p1lifePoints, p2lifePoints: p2lifePoints)
        
        print("Le combat est terminé, isOver: \(isOverResult)")
        
        if let currentCharacter1 = currentCharacter1, let currentCharacter2 = currentCharacter2{        winnerTeamId = fightResult(player1: player1, player2: player2, currentCharacter1: currentCharacter1, currentCharacter2: currentCharacter2, p1Points:p1lifePoints, p2Points:p2lifePoints)
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

    ///This function return a Boolean at a fight end
    func isOver(p1lifePoints: Int, p2lifePoints: Int) -> Bool {
        return p1lifePoints <= 0 || p2lifePoints <= 0
    }
    
    ///This function show the fighters list
    func showFighters(player: Player){
        for userCharacter in player.userCharacters {
            if (userCharacter.isLiving) {
                print("Nom -> \(userCharacter.name), Profile -> \(userCharacter.profile) Tapez \(userCharacter.id)")
            }
        }
        
    }
    
    ///This function allow a fighter choice for a fight
    func chooseFighter(player: Player)->UserCharacter?{
        var charInput1: Int?
        var currentCharacter: UserCharacter?
        
        while true {
            if let curCharInput1 = readLine(), !curCharInput1.isEmpty, let inputInt = Int(curCharInput1), (1...maxCharacters).contains(inputInt) {
                charInput1 = inputInt
                break
            } else {
                print("Veuillez saisir un nombre entre 1 et \(maxCharacters).")
            }
        }

        if let charInput1 = charInput1 {
            currentCharacter = selectFighter(choice: charInput1, player: player)
        }
        
        return currentCharacter
        
    }
    
    ///This function display the list of the available actions for a fight
    func showAction(){
        print("Veuillez saisir une action:")
        print("Attaque à l'épée   -> Tapez 1")
        print("Attaque à la lance -> Tapez 2")
        print("Attaque au couteau -> Tapez 3")
        print("Soin               -> Tapez 4")
    }
    
    ///This function allow the choice on an action for a fight
    func selectAction(attacker:Player, opponent:Player, attackCharacter: UserCharacter, defenseCharacter: UserCharacter) -> Int{
        
        var actionInput1: Int?
            var pLifePoints = defenseCharacter.lifePoint

            while actionInput1 == nil {
                if let input1 = readLine(), !input1.isEmpty, let inputInt = Int(input1), (1...4).contains(inputInt) {
                    actionInput1 = inputInt
                } else {
                    print("Veuillez saisir un nombre compris entre 1 et 4.")
                }
            }

            if let actionInput1 = actionInput1 {
                if actionInput1 == 4 {
                    attacker.care(currentCharacter: attackCharacter)
                } else {
                    let playerHit = attacker.attack(weaponChoice: actionInput1, currentCharacter: attackCharacter)
                    pLifePoints -= playerHit
                    
                    if pLifePoints <= 0 {
                        pLifePoints = 0 
                    }
                    
                    defenseCharacter.lifePoint = pLifePoints
                }
            }
            
            return pLifePoints
    }
    
    ///This function display the fighters lifepoints
    func showFightPoints(currentCharacterName1: String, currentCharacterName2: String, p1Points:Int, p2Points:Int){
        print("\(String(describing: currentCharacterName1)) a \(p1Points) points")
        print("\(String(describing: currentCharacterName2)) a \(p2Points) points")
        
    }
    
    ///This function return an Int value to describe the winner's team id
    func fightResult(player1: Player, player2: Player, currentCharacter1: UserCharacter, currentCharacter2: UserCharacter, p1Points:Int, p2Points:Int) -> Int {

        if p1Points < p2Points {
            winnerTeamId = 2
            currentCharacter1.isLiving=false
            player1.deadCharacters.append(currentCharacter1)
        } else if p2Points < p1Points {
            winnerTeamId = 1
            currentCharacter2.isLiving=false
            player2.deadCharacters.append(currentCharacter2)
        } else {
            winnerTeamId = 0
        }
        
        return winnerTeamId
    }
    
    

    
    
    
}

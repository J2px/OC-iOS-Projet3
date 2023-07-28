//
//  Fight.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 25/07/2023.
//

import Foundation

class Fight {
    var winner: UserCharacter?
    var loser: UserCharacter?
    var loserTeamId=0
    
    func start(player1: Player, player2: Player) {
        var currentCharacter1: UserCharacter?
        var currentCharacter2: UserCharacter?
        
        
        print("Joueur \(player1.id)")
        print("Veuillez sélectionner votre combattant")
        for userCharacter in player1.userCharacters {
            print("Personnage \(userCharacter.id): Nom -> \(userCharacter.name), Profile -> \(userCharacter.profile)")
        }
        if let curCharInput1 = readLine(), let charInput1 = Int(curCharInput1) {
            currentCharacter1 = selectFighter(choice: charInput1, player: player1)
        }
        
        print("Joueur \(player2.id)")
        print("Veuillez sélectionner votre combattant")
        for userCharacter in player2.userCharacters {
            print("Personnage \(userCharacter.id): Nom -> \(userCharacter.name), Profile -> \(userCharacter.profile)")
        }
        if let curCharInput2 = readLine(), let charInput2 = Int(curCharInput2) {
            currentCharacter2 = selectFighter(choice: charInput2, player: player2)
        }

        var p1lifePoints = currentCharacter1?.lifePoint ?? 0
        var p2lifePoints = currentCharacter2?.lifePoint ?? 0

        while p1lifePoints > 0 && p2lifePoints > 0 {
            // Le joueur 1 saisit un type d'attaque
            print("Pour \(currentCharacter1!.name)")
            print("Veuillez saisir une action:")
            print("Attaque à l'épée   -> Tapez 1")
            print("Attaque à la lance -> Tapez 2")
            print("Attaque au couteau -> Tapez 3")
            print("Soin               -> Tapez 4")
            if let input1 = readLine(), let actionInput1 = Int(input1) {
                let player1hit = player1.attack(choice: actionInput1, currentCharacter: currentCharacter1!)
                p2lifePoints -= player1hit
            }

            // Le joueur 2 saisit un type d'attaque
            print("Pour \(currentCharacter2!.name)")
            print("Veuillez saisir une action:")
            print("Attaque à l'épée   -> Tapez 1")
            print("Attaque à la lance -> Tapez 2")
            print("Attaque au couteau -> Tapez 3")
            print("Soin               -> Tapez 4")
            if let input2 = readLine(), let actionInput2 = Int(input2) {
                let player2hit = player2.attack(choice: actionInput2, currentCharacter: currentCharacter2!)
                p1lifePoints -= player2hit
            }
            
            print("\(currentCharacter1!.name) a \(p1lifePoints) points")
            print("\(currentCharacter2!.name) a \(p2lifePoints) points")
            
        }

        
        let isOverResult = isOver(p1lifePoints: p1lifePoints, p2lifePoints: p2lifePoints)
        
        print("Le combat est terminé, isOver: \(isOverResult)")
        
        winner=getWinner(currentCharacter1: currentCharacter1!, currentCharacter2: currentCharacter2!)
        print("Le vainqueur du combat est \(winner!.name)")
        loser=getLoser(currentCharacter1: currentCharacter1!, currentCharacter2: currentCharacter2!)
        print("Le perdant est \(loser!.name)")
        
        deleteLoser(loser: loser!, userCharacters1: &player1.userCharacters, userCharacters2: &player2.userCharacters)
        
    }

    func selectFighter(choice: Int, player: Player) -> UserCharacter? {
        guard choice > 0 && choice <= player.userCharacters.count else {
            return nil
        }
        return player.userCharacters[choice - 1]
    }

    func isOver(p1lifePoints: Int, p2lifePoints: Int) -> Bool {
        return p1lifePoints <= 0 || p2lifePoints <= 0
    }
    
    func getWinner(currentCharacter1: UserCharacter, currentCharacter2: UserCharacter)->UserCharacter{
        var winner:UserCharacter?
        
        if(currentCharacter1.lifePoint<=0){
            winner=currentCharacter2
        }
        
        if(currentCharacter2.lifePoint<=0){
            winner=currentCharacter1
        }
        
        return winner!
    }
    
    func getLoser(currentCharacter1: UserCharacter, currentCharacter2: UserCharacter)->UserCharacter{
        var loser:UserCharacter?
        
        if(currentCharacter1.lifePoint<=0){
            loser=currentCharacter1
            currentCharacter1.isLiving=false
            loserTeamId = 1
            
        }
        
        if(currentCharacter2.lifePoint<=0){
            loser=currentCharacter1
            currentCharacter1.isLiving=false
            loserTeamId = 2
            
        }
        
        return loser!
    }
    
    func deleteLoser(loser:UserCharacter, userCharacters1: inout [UserCharacter], userCharacters2: inout [UserCharacter]){
        let id = loser.id
        if(loserTeamId == 1){
            userCharacters1.remove(at:id)
        }
        if(loserTeamId == 2){
            userCharacters1.remove(at:id)
            
        }
    }
    
    
    
    
}

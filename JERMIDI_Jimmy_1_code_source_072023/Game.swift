//
//  Game.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 17/07/2023.
//

import Foundation

class Game{
    let id = UUID().uuidString
    
    
    func start(){
        let maxCharacters = 3
        let player1 = Player()
        let player2 = Player()
        
        //*********** JOUEUR 1 *************************************************
        var idplayer1 = player1.id
        idplayer1 = 1
        print("Joueur n°\(idplayer1)")
        print("Pour commencer, veuillez créer vos \(maxCharacters) personnages")
        while (player1.userCharacters.count < maxCharacters) {
            let i = player1.userCharacters.count
            print("Personnage \(i + 1)")
            print("Quel est son nom?")
            if let name = readLine(),!name.isEmpty {
                print("Quel est son profil?")
                print("1 pour Warrior, 2 pour Magus, 3 pour Colossus, 4 pour Dwarf")
                
                if let input = readLine(), let profileInput = Int(input) {
                    player1.createUserCharacter(id: i+1, name: name, profile: profileInput)
                }
            }
        }
        print("Joueur n°\(idplayer1)")
        print("Liste des personnages de votre équipe:")
        for userCharacter in player1.userCharacters {
            print("Personnage \(userCharacter.id): Nom -> \(userCharacter.name), Profile -> \(userCharacter.profile)")
        }
        
        print("Quel est le nom de votre équipe :")
        if let teamName1 = readLine(),!teamName1.isEmpty {
            player1.teamName=teamName1
            print("Le nom de votre équipe est \(teamName1)")
            }
        print()
        
        //*********** JOUEUR 2 *************************************************
        var idplayer2 = player2.id
        idplayer2 = 2
        print("Joueur n°\(idplayer2)")
        print("Pour commencer, veuillez créer vos\(maxCharacters)personnages")
        while (player2.userCharacters.count < maxCharacters) {
            let i = player2.userCharacters.count
            print("Personnage \(i + 1)")
            print("Quel est son nom?")
            if let name = readLine(),!name.isEmpty {
                print("Quel est son profil?")
                print("1 pour Warrior, 2 pour Magus, 3 pour Colossus, 4 pour Dwarf")
                
                if let input = readLine(), let profileInput = Int(input) {
                    player2.createUserCharacter(id: i+1, name: name, profile: profileInput)
                }
            }
        }
        print("Joueur n°\(idplayer2)")
        print("Liste des personnages de votre équipe:")
        for userCharacter in player2.userCharacters {
            print("Personnage \(userCharacter.id): Nom -> \(userCharacter.name), Profile -> \(userCharacter.profile)")
        }
        
        print("Quel est le nom de votre équipe :")
        if let teamName2 = readLine(),!teamName2.isEmpty {
            player2.teamName=teamName2
            print("Le nom de votre équipe est \(teamName2)")
            }
        print()
        
        print()
        print("***********************************************")
        print("****************** COMBAT *********************")
        print("***********************************************")
        print()
        
        let fight = Fight()
        var loserArray1: [UserCharacter] = []
        var loserArray2: [UserCharacter] = []
        
        while loserArray1.count < maxCharacters && loserArray2.count < maxCharacters {
            fight.start(player1: player1, player2: player2)
            if(fight.loserTeamId==1){
                loserArray1.append(fight.loser!)
            }
            
            if(fight.loserTeamId==2){
                loserArray2.append(fight.loser!)
            }
            
            print("Personnages éliminés dans l'équipe \(player1.teamName):")
            for loser in loserArray1 {
                print("Nom -> \(loser.name), Profile -> \(loser.profile)")
            }
            
            print("Personnages éliminés dans l'équipe \(player2.teamName):")
            for loser in loserArray2 {
                print("Nom -> \(loser.name), Profile -> \(loser.profile)")
            }
            
        }
        
        print()
        print("***********************************************")
        print("************ COMBATS TERMINES *****************")
        print("***********************************************")
        print()
        
        if(loserArray1.count == maxCharacters){
            print("Résultat final: Le vainqueur est l'équipe \(player2.teamName)")
        }
        
        if(loserArray2.count == maxCharacters){
            print("Résultat final: Le vainqueur est l'équipe \(player1.teamName)")
        }
        
    }
    
    
    
}

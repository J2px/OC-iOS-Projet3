//
//  Game.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 17/07/2023.
//

import Foundation

class Game{
    
    let id = UUID().uuidString
    let maxCharacters: Int
    
    init(maxCharacters: Int) {
        self.maxCharacters = maxCharacters
    }
    
    /// This function start the game
    ///  1. Init two players
    ///  2. For each pelayer, create characters accordin to `maxCharacters`
    func start(){
        let player1 = Player()
        let player2 = Player()
        
        /// Player 1: character selection
        print("Joueur n°1")
        print("Pour commencer, veuillez créer vos \(maxCharacters) personnages")
        while (player1.userCharacters.count < maxCharacters) {
            let i = player1.userCharacters.count
            print("Personnage \(i + 1)")
            print("Quel est son nom?")
            if let name = readLine(),!name.isEmpty {
                print("Quel est son profil?")
                print("1 pour Warrior, 2 pour Magus, 3 pour Colossus, 4 pour Dwarf")
                
                if let input = readLine(), let profileInput = Int(input) {
                    player1.createUserCharacter(name: name, profile: profileInput)
                }
            }
        }
        print("Joueur n°1")
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
        
        /// Player 2: character selection
        print("Joueur n°2")
        print("Pour commencer, veuillez créer vos\(maxCharacters)personnages")
        while (player2.userCharacters.count < maxCharacters) {
            let i = player2.userCharacters.count
            print("Personnage \(i + 1)")
            print("Quel est son nom?")
            if let name = readLine(),!name.isEmpty {
                print("Quel est son profil?")
                print("1 pour Warrior, 2 pour Magus, 3 pour Colossus, 4 pour Dwarf")
                
                if let input = readLine(), let profileInput = Int(input) {
                    player2.createUserCharacter(name: name, profile: profileInput)
                }
            }
        }
        print("Joueur n°2")
        print("Liste des personnages de votre équipe:")
        for userCharacter in player2.userCharacters {
            print("Personnage \(userCharacter.id): Nom -> \(userCharacter.name), Profile -> \(userCharacter.profile)")
        }
        
        print("Quel est le nom de votre équipe :")
        if let teamName2 = readLine(),!teamName2.isEmpty {
            player2.teamName=teamName2
            print("Le nom de votre équipe est \(teamName2)")
            }
        
        /// Fight loop
        print()
        
        print()
        print("***********************************************")
        print("****************** COMBAT *********************")
        print("***********************************************")
        print()
        
        let fight = Fight()
        
        while player1.isAlive() && player2.isAlive()  {
            let winner = fight.start(player1: player1, player2: player2)
            
            if winner == 1{
                print("Le vainqueur du combat est le joueur 1")
            }else if(winner == 2){
                print("Le vainqueur du combat est le joueur 2")
            }else{
                print("Match nul")
            }
        }
        
        /// Game result
        
        print()
        print("***********************************************")
        print("************ COMBATS TERMINES *****************")
        print("***********************************************")
        print()
        
        
         if(player2.deadCharacters.count == maxCharacters){
             print("Résultat final: Le vainqueur est l'équipe \(player1.teamName)")
         }
         
         if(player1.deadCharacters.count == maxCharacters){
             print("Résultat final: Le vainqueur est l'équipe \(player2.teamName)")
        }
        
        
        
    }
    
    
    
}

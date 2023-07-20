//
//  Game.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 17/07/2023.
//

import Foundation

class Game{
    var id=0
    /*var player:Player
    
    init(player:Player){
        self.player=player
    }*/
    
    
    func start(){
        let maxCharacter = 3
        var userTeam: [UserCharacter] = []
        let player1 = Player()
        print("Pour commencer, veuillez créer vos\(maxCharacter)personnages")
        for i in 1...maxCharacter {
            print("Personnage \(i)")
            print("Quel est son nom?")
            if let name = readLine(),!name.isEmpty {
                print("Quel est son profil?")
                print("1 pour Warrior, 2 pour Magus, 3 pour Colossus, 4 pour Dwarf")
                
                if let input = readLine(), let profileInput = Int(input) {
                let userCharacter = player1.createUserCharacter(id: i, name: name, profile: profileInput)
                    userTeam.append(userCharacter)
                    
                }
            }
        }
            print("Liste des personnages de votre équipe:")
            for userCharacter in userTeam {
                print("Personnage \(userCharacter.id): Nom -> \(userCharacter.name), Profile -> \(userCharacter.profile)")
            }
        
        print("Quel est le nom de votre équipe :")
        if let teamName = readLine(),!teamName.isEmpty {
            player1.teamName=teamName
            print("Le nom de votre équipe est \(teamName)")
            }
        print()
        print("***********************************************")
        print("      Présentation des équipes adverses :")
        print("***********************************************")
        print()
        print("Equipe adverse 1: Adversaire(a), Adversaire(b), Adversaire(c)")
        print("Tapez 1")
        print()
        print("Equipe adverse 2: Adversaire(d), Adversaire(e), Adversaire(f)")
        print("Tapez 2")
        print()
        print("Equipe adverse 3: Adversaire(g), Adversaire(h), Adversaire(i)")
        print("Tapez 3")
        
        if let choiceInput = readLine(), let teamChoice = Int(choiceInput){
            //print("Vous avez choisi l'équipe n°\(teamChoice)")
            switch teamChoice{
            case 1:
                print("Vous affrontrez l'équipe 1")
            case 2:
                print("Vous affrontrez l'équipe 2")
            case 3:
                print("Vous affrontrez l'équipe 3")
            default:
                print("Saisie incorrecte")
            }
        }
        
        print()
        print("***********************************************")
        print("****************** COMBAT *********************")
        print("***********************************************")
        print()
        print("Choisissez votre combattant")
        for userCharacter in userTeam {
            print("Pour \(userCharacter.name), tapez \(userCharacter.id)")
        }
        
        if let charChoiceInput = readLine(), let characterChoice = Int(charChoiceInput){
            //print("Vous avez choisi l'équipe n°\(teamChoice)")
            switch characterChoice{
            case 1:
                print("Vous avez choisi le combattant n°1")
            case 2:
                print("Vous avez choisi le combattant n°2")
            case 3:
                print("Vous avez choisi le combattant n°3")
            default:
                print("Saisie incorrecte")
            }
        }
        
        print()
        print("Choisissez le combattant de l'équipe adverse")
        
        if let oppChoiceInput = readLine(), let opponentChoice = Int(oppChoiceInput){
            //print("Vous avez choisi l'équipe n°\(teamChoice)")
            switch opponentChoice{
            case 1:
                print("Vous avez choisi le combattant n°1")
            case 2:
                print("Vous avez choisi le combattant n°2")
            case 3:
                print("Vous avez choisi le combattant n°3")
            default:
                print("Saisie incorrecte")
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
}

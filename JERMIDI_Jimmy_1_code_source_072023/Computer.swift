//
//  Computer.swift
//  JERMIDI_Jimmy_1_code_source_072023
//
//  Created by Jimmy JERMIDI on 20/07/2023.
//

import Foundation

class Computer{
    var teamName=" "
    
    
    func createTeam(teamChoice: Int)->[UserCharacter]{
        var ComputerTeam: [UserCharacter] = []
        switch teamChoice{
        case 1:
            let Opp1 = UserCharacter(id:4,name:"Adversaire(a)",profile:4)
            ComputerTeam.append(Opp1)
            let Opp2 = UserCharacter(id:5,name:"Adversaire(b)",profile:2)
            ComputerTeam.append(Opp2)
            let Opp3 = UserCharacter(id:6,name:"Adversaire(c)",profile:1)
            ComputerTeam.append(Opp3)
        case 2:
            let Opp4 = UserCharacter(id:7,name:"Adversaire(d)",profile:4)
            ComputerTeam.append(Opp4)
            let Opp5 = UserCharacter(id:8,name:"Adversaire(e)",profile:1)
            ComputerTeam.append(Opp5)
            let Opp6 = UserCharacter(id:9,name:"Adversaire(f)",profile:3)
            ComputerTeam.append(Opp6)
        case 3:
            let Opp7 = UserCharacter(id:10,name:"Adversaire(d)",profile:2)
            ComputerTeam.append(Opp7)
            let Opp8 = UserCharacter(id:11,name:"Adversaire(e)",profile:3)
            ComputerTeam.append(Opp8)
            let Opp9 = UserCharacter(id:12,name:"Adversaire(f)",profile:1)
            ComputerTeam.append(Opp9)
        default:
            print("Erreur")
        }
        
        return ComputerTeam
    }
    
    func Attack(){
        
        
    }
    
    func Care(){
        
        
    }
    
    
    
    
}

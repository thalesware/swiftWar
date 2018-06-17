//
//  Estado.swift
//  SwiftWar
//
//  Created by i9access on 16/06/18.
//  Copyright © 2018 i9access. All rights reserved.
//

import Foundation
import UIKit

class Estado {
    
    var estadoLabel: UILabel
    
    var nome: String
    
    var fronteiras: [String]
    
    var numTropas = 0
    var corTropas: String
    
  
    
    // construtor auxiliar onde podemos passar já as informações de nome e fronteira
    init (nome: String,fronteiras: [String], label: UILabel){
        self.fronteiras = fronteiras
        self.nome = nome
        self.estadoLabel = label
        self.corTropas = "Cinza"
    }
    
}

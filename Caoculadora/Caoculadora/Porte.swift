//
//  Porte.swift
//  Caoculadora
//
//  Created by Francisco Miranda Soares on 13/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    
    case pequenito = "Pequeno"
    case mediano = "Médio"
    case grandito = "Grande"

    func calcularIdade(deAnos anosCaninos: Int,
                      eMeses mesesCaninos: Int) -> Int {

        
        let multiplicador: Int
        
        switch self {
        case .pequenito:
            multiplicador = 1
        case .mediano:
            multiplicador = 2
        case .grandito:
            multiplicador = 3
        }

        return anosCaninos * multiplicador + mesesCaninos * multiplicador / 12
        
    }
}


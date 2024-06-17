//
//  Porte.swift
//  Caoculadora
//
//  Created by Francisco Miranda Soares on 13/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case small = "Pequeno"
    case medium = "Médio"
    case large = "Grande"

    func calcularIdade(deAnos anosCaninos: Int,
                      eMeses mesesCaninos: Int) -> Int {

        
        let multiplicador: Int
        
        switch self {
        case .small:
            multiplicador = 6
        case .medium:
            multiplicador = 7
        case .large:
            multiplicador = 8
        }

        let result = anosCaninos * multiplicador + mesesCaninos * multiplicador / 12
        
        return result
        
        
    }
}


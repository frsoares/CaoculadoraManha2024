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
    case big = "Grande"

    func calcularIdade(deAnos anosCaninos: Int,
                      eMeses mesesCaninos: Int) -> Int {
        // o resultado vai ser os anos * multiplicador + a fração do ano em meses * multiplicador
        // multiplicador:
        //   * pequeno: 6
        //   * médio: 7
        //   * grande: 8
        
        let multiplicador: Int
        
        switch self {
        case .small:
            multiplicador = 6
        case .medium:
            multiplicador = 7
        case .big:
            multiplicador = 8
        }

        let result = anosCaninos * multiplicador + mesesCaninos * multiplicador / 12
        
        return result
        
        
    }
}


//
//  Card.swift
//  Concentration
//
//  Created by Guilherme de Assis dos Santos on 11/05/21.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        // Por ser método estatico, não é necessário usar a classe antes de chamar outro método ou variavel estática
        Card.identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
        
    }
}

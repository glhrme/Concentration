//
//  ViewController.swift
//  Concentration
//
//  Created by Guilherme de Assis dos Santos on 10/05/21.
//

import UIKit

class ConcentrationViewController: UIViewController {
       
    // Lazy diz que apenas será inicializada quando alguém tentar usar
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!

    
    
    @IBAction func clickCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Selecione outra carta")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9257717729, green: 0.2369031906, blue: 0.103286542, alpha: 1)
            }
        }
    }
    
    
    var emojiChoices = ["👻", "😆", "🏎", "🚜", "📽", "🍎"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        /* if emoji[card.identifier] != nil {
            return  emoji[card.identifier]!
        } else {
            return "?"
        } */
        
        if  emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices[randomIndex]
        }
        
        return  emoji[card.identifier] ?? "?"
    }
    
}


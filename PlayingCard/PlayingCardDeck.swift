//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Christiaan van Bemmel on 16/08/2019.
//  Copyright © 2019 Christiaan van Bemmel. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        
        if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        
        return 0
    }
}

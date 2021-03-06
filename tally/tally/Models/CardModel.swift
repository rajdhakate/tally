//
//  CardModel.swift
//  tally
//
//  Created by Raj Dhakate on 06/03/21.
//  Copyright © 2021 Dhakate Codes. All rights reserved.
//

import Foundation

enum Suit: Int {
    case heart, spade, diamond, club
}

struct CardModel: Identifiable, Hashable {
    let id: String
    
    var suit: Suit
    var number: Int
}

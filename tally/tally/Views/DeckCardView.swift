//
//  DeckCardView.swift
//  tally
//
//  Created by Raj Dhakate on 06/03/21.
//  Copyright © 2021 Dhakate Codes. All rights reserved.
//

import SwiftUI

struct DeckCardView: View {
    
    var card: CardModel
    
    var body: some View {
        GeometryReader { (geometry) in
            if card.number == 0 {
                Image("deck_back")
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(geometry.size.width/15)
                
            } else {
                VStack {
                    HStack {
                        Text(self.getCardNumber(card))
                            .font(.system(size: geometry.size.width/4.5))
                            .bold()
                        Spacer()
                    }
                    
                    Image(card.suit.rawValue == 1 ? "heart" : (card.suit.rawValue == 2 ? "spade" : (card.suit.rawValue == 3 ? "diamond" : "club")))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width/2.5, height: geometry.size.width/2.5)
                    
                    HStack {
                        Spacer()
                        Text(self.getCardNumber(card))
                            .font(.system(size: geometry.size.width/4.5))
                            .bold()
                    }
                }
                .padding()
                .background(Color.white
                                .cornerRadius(geometry.size.width/15))
                .frame(width: geometry.size.width, height: geometry.size.height)
                .overlay(
                        RoundedRectangle(cornerRadius: geometry.size.width/15)
                            .stroke(Color.gray, lineWidth: 2)
                    )
            }
        }
    }
    
    private func getCardNumber(_ card: CardModel) -> String {
        return (card.number == 1 ? "A" : (card.number == 11 ? "J" : (card.number == 12 ? "Q" : (card.number == 13 ? "K" : "\(card.number)"))))
    }
}

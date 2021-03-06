//
//  RandomCardView.swift
//  tally
//
//  Created by Raj Dhakate on 06/03/21.
//  Copyright © 2021 Dhakate Codes. All rights reserved.
//

import SwiftUI

struct RandomCardView: View {
    
    @State private var cards = [CardModel]()
    
    @State private var columnGrid = [GridItem(.flexible())]
    
    var body: some View {
        VStack {
            ScrollView {
                Text("You can always shake your phone for randomness")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
                
                LazyVGrid(columns: columnGrid, spacing: 20) {
                    ForEach(cards, id: \.self) { card in
                        // deck card
                        DeckCardView(card: card)
                            .frame(width: 150, height: 200)
                            .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                                self.pickCard()
                            }
                    }
                }
            }
            
            HStack {
                
                Button(action: {
                    self.pickCard()
                }, label: {
                    Image("deck")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 80, height: 80)
                })
                
                Spacer()
                
                Button(action: {
                    self.resetCards()
                }, label: {
                    Image("shuffle")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                })
                
                Spacer()
                
                if cards.count > 1 {
                    Button(action: {
                        self.cards.removeLast()
                        
                        self.resetCards()
                        
                        if self.cards.count == 1 {
                            self.columnGrid.removeLast()
                        }
                    }, label: {
                        Image("minus")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 50, height: 50)
                    })
                }
                
                Button(action: {
                    self.cards.append(CardModel(id: "card\(self.cards.count+1)", suit: getRandomSuit(), number: 0))
                    
                    self.resetCards()
                    
                    if self.cards.count == 2 {
                        self.columnGrid.append(GridItem(.flexible()))
                    }
                }, label: {
                    Image("plus")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 50, height: 50)
                })
            }
            .padding()
        }
        .navigationTitle("Pick a card")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.cards.append(CardModel(id: "card1", suit: getRandomSuit(), number: 0))
        }
    }
    
    private func resetCards() {
        self.cards = self.cards.map({ (coinModel) -> CardModel in
            var editedModel = coinModel
            editedModel.number = 0
            return editedModel
        })
    }
    
    private func pickCard() {
        self.cards = self.cards.map({ (coinModel) -> CardModel in
            var editedModel = coinModel
            editedModel.suit = self.getRandomSuit()
            editedModel.number = Functions.getRandomInt(till: 13)
            return editedModel
        })
    }
    
    private func getRandomSuit() -> Suit {
        return Suit.init(rawValue: Int.random(in: 0...3))!
    }
    
}

struct RandomCardView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCardView()
    }
}


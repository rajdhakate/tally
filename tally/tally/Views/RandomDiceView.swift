//
//  RandomDiceView.swift
//  tally
//
//  Created by Raj Dhakate on 05/03/21.
//  Copyright © 2021 Dhakate Codes. All rights reserved.
//

import SwiftUI

struct RandomDiceView: View {
    
    @State private var dices = [DiceModel]()
    
    @State private var columnGrid = [GridItem(.flexible())]
    
    var body: some View {
        VStack {
            ScrollView {
                Text("You can always shake your phone for randomness")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
                
                LazyVGrid(columns: columnGrid, spacing: 20) {
                    ForEach(dices, id: \.self) { dice in
                        Image("\(dice.number)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                                self.rollDice()
                            }
                    }
                }
            }
            
            HStack {
                
                Button(action: {
                    self.rollDice()
                }, label: {
                    Image("dices")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 80, height: 80)
                })
                
                Spacer()
                
                if dices.count > 1 {
                    Button(action: {
                        self.dices.removeLast()
                        
                        if self.dices.count == 1 {
                            self.columnGrid.removeLast()
                        } else if self.dices.count == 2 {
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
                    self.dices.append(DiceModel(id: "dice\(self.dices.count+1)", number: Functions.getRandomInt(till: 6)))
                    
                    if self.dices.count == 2 {
                        self.columnGrid.append(GridItem(.flexible()))
                    } else if self.dices.count == 3 {
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
        .navigationTitle("Roll a dice")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.dices.append(DiceModel(id: "dice1", number: Functions.getRandomInt(till: 6)))
        }
    }
    
    private func rollDice() {
        self.dices = self.dices.map({ (diceModel) -> DiceModel in
            var editedModel = diceModel
            editedModel.number = Functions.getRandomInt(till: 6)
            return editedModel
        })
    }
    
}

struct RandomDiceView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDiceView()
            
    }
}

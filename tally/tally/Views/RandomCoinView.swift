//
//  RandomCoinView.swift
//  tally
//
//  Created by Raj Dhakate on 06/03/21.
//  Copyright © 2021 Dhakate Codes. All rights reserved.
//

import SwiftUI

struct RandomCoinView: View {
    
    @State private var coins = [CoinModel]()
    
    @State private var columnGrid = [GridItem(.flexible())]
    
    var body: some View {
        VStack {
            ScrollView {
                Text("You can always shake your phone for randomness")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding()
                
                LazyVGrid(columns: columnGrid, spacing: 20) {
                    ForEach(coins, id: \.self) { coin in
                        Image(coin.face == 0 ? "coin" : (coin.face == 1 ? "heads" : "tails"))
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
                    Image("toss")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 80, height: 80)
                })
                
                Spacer()
                
                Button(action: {
                    self.resetCoins()
                }, label: {
                    Image("cover")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 80, height: 80)
                })
                
                Spacer()
                
                if coins.count > 1 {
                    Button(action: {
                        self.coins.removeLast()
                        
                        self.resetCoins()
                        
                        if self.coins.count == 1 {
                            self.columnGrid.removeLast()
                        } else if self.coins.count == 2 {
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
                    self.coins.append(CoinModel(id: "coin\(self.coins.count+1)", face: 0))
                    
                    self.resetCoins()
                    
                    if self.coins.count == 2 {
                        self.columnGrid.append(GridItem(.flexible()))
                    } else if self.coins.count == 3 {
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
        .navigationTitle("Toss a coin")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.coins.append(CoinModel(id: "coin1", face: 0))
        }
    }
    
    private func resetCoins() {
        self.coins = self.coins.map({ (coinModel) -> CoinModel in
            var editedModel = coinModel
            editedModel.face = 0
            return editedModel
        })
    }
    
    private func rollDice() {
        self.coins = self.coins.map({ (coinModel) -> CoinModel in
            var editedModel = coinModel
            editedModel.face = Functions.getRandomInt(till: 2)
            return editedModel
        })
    }
    
}

struct RandomCoinView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCoinView()
    }
}

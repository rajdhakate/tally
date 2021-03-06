//
//  ContentView.swift
//  tally
//
//  Created by Raj Dhakate on 03/03/21.
//  Copyright © 2021 Dhakate Codes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationLink(
                        destination: RandomDiceView(),
                        label: {
                            HomeCard(title: "Roll a dice", image: "dices")
                        })
                    
                    NavigationLink(
                        destination: RandomCoinView(),
                        label: {
                            HomeCard(title: "Flip a coin", image: "toss")
                        })
                    
                    NavigationLink(
                        destination: RandomCardView(),
                        label: {
                            HomeCard(title: "Pick a card", image: "deck")
                        })
                }
                .padding()
            }
            .navigationTitle("Pick your randomness")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

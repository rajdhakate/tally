//
//  HomeCard.swift
//  tally
//
//  Created by Raj Dhakate on 06/03/21.
//  Copyright © 2021 Dhakate Codes. All rights reserved.
//

import SwiftUI

struct HomeCard: View {
    
    let title: String
    let image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .font(.title)
                .bold()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 3)
        )
    }
}

struct HomeCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeCard(title: "Flip a coin", image: "toss")
    }
}

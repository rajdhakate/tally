//
//  Functions.swift
//  tally
//
//  Created by Raj Dhakate on 06/03/21.
//  Copyright © 2021 Dhakate Codes. All rights reserved.
//

import Foundation

class Functions {
    class func getRandomInt(till int: Int) -> Int {
        return Int.random(in: 1...int)
    }
}

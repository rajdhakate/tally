//
//  TallyContact.swift
//  tally
//
//  Created by Raj Dhakate on 03/03/21.
//  Copyright © 2021 Dhakate Codes. All rights reserved.
//

import Foundation

struct TallyContact: Codable {
    var id: String
    var firstName: String
    var lastName: String
    var profileImage: String
    var numbers: [MobileNumber]
    var emails: [EmailID]
    var links: [Link]
    var address: [Address]
}

struct MobileNumber: Codable {
    var number: String
    var stdCode: String
    var place: String
    var isVerified: String
}

struct EmailID: Codable {
    var email: String
    var place: String
    var isVerified: Bool
}

struct Link: Codable {
    var url: String
    var place: String
}

struct Address: Codable {
    var aptNo: String
    var streetAdress: String
    var area: String
    var city: String
    var state: String
    var country: String
    var pincode: String
}

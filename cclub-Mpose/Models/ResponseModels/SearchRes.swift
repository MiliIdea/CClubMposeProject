//
//  SearchRes.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/27/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

struct SearchRes : Codable {
    let personId : CLongLong?
    let ccardNumber : String?
    let firstName : String?
    let lastName : String?
    let mobileNumber : String?
    let ccardPassword : String?
    let sex : Int?
    let birthDate : String?
    
    enum CodingKeys: String, CodingKey {
        
        case personId = "personId"
        case ccardNumber = "ccardNumber"
        case firstName = "firstName"
        case lastName = "lastName"
        case mobileNumber = "mobileNumber"
        case ccardPassword = "ccardPassword"
        case sex = "sex"
        case birthDate = "birthDate"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        personId = try values.decodeIfPresent(CLongLong.self, forKey: .personId)
        ccardNumber = try values.decodeIfPresent(String.self, forKey: .ccardNumber)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        mobileNumber = try values.decodeIfPresent(String.self, forKey: .mobileNumber)
        ccardPassword = try values.decodeIfPresent(String.self, forKey: .ccardPassword)
        sex = try values.decodeIfPresent(Int.self, forKey: .sex)
        birthDate = try values.decodeIfPresent(String.self, forKey: .birthDate)
    }
    
}

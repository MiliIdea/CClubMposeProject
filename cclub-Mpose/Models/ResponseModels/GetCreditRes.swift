//
//  GetCreditRes.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/28/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

import Foundation
struct GetCreditRes : Codable {
    let organizationId : CLongLong?
    let organizationName : String?
    let ccardSegmentId : CLongLong?
    let ccardSegmentName : String?
    let creditBalanceValue : CLongLong?
    
    enum CodingKeys: String, CodingKey {
        
        case organizationId = "organizationId"
        case organizationName = "organizationName"
        case ccardSegmentId = "ccardSegmentId"
        case ccardSegmentName = "ccardSegmentName"
        case creditBalanceValue = "creditBalanceValue"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        organizationId = try values.decodeIfPresent(CLongLong.self, forKey: .organizationId)
        organizationName = try values.decodeIfPresent(String.self, forKey: .organizationName)
        ccardSegmentId = try values.decodeIfPresent(CLongLong.self, forKey: .ccardSegmentId)
        ccardSegmentName = try values.decodeIfPresent(String.self, forKey: .ccardSegmentName)
        creditBalanceValue = try values.decodeIfPresent(CLongLong.self, forKey: .creditBalanceValue)
    }
    
}

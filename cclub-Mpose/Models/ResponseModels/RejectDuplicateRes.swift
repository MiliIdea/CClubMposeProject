//
//  RejectDuplicateRes.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/30/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

struct RejectDuplicateRes : Codable {
    let discount : Int?
    let referenceId : Int?
    let active : Bool?
    let amount : CLongLong?
    let issueDate : String?
    let issueTime : String?
    let rowId : Int?
    let personId : Int?
    let transactionMasterId : Int?
    let sourceDbReferenceId : String?
    let posSerial : String?
    let eventTypeId : Int?
    let sourceDbId : String?
    let totalPrice : Int?
    let organizationId : Int?
    let ccardNumber : String?
    let organizationAccessKey : String?
    
    enum CodingKeys: String, CodingKey {
        
        case discount = "discount"
        case referenceId = "referenceId"
        case active = "active"
        case amount = "amount"
        case issueDate = "issueDate"
        case issueTime = "issueTime"
        case rowId = "rowId"
        case personId = "personId"
        case transactionMasterId = "transactionMasterId"
        case sourceDbReferenceId = "sourceDbReferenceId"
        case posSerial = "posSerial"
        case eventTypeId = "eventTypeId"
        case sourceDbId = "sourceDbId"
        case totalPrice = "totalPrice"
        case organizationId = "organizationId"
        case ccardNumber = "ccardNumber"
        case organizationAccessKey = "organizationAccessKey"
    }
    
   
}

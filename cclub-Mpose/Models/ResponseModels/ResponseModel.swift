//
//  ResponseModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/27/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

struct ResponseModel <T : Codable> : Codable {
    let done : Bool?
    let resultCountAll : Int?
    let allDataCount : Int?
    let result : T?
    let errorDesc : String?
    
    enum CodingKeys: String, CodingKey {
        
        case done = "done"
        case resultCountAll = "resultCountAll"
        case allDataCount = "allDataCount"
        case errorDesc = "errorDesc"
        case result
    }
    
}

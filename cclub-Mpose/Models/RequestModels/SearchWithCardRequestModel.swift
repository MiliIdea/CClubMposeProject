//
//  SearchWithCardRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/27/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class SearchWithCardRequestModel {
    
    init(ccardNumber : String!) {
        
        self.ccardNumber = ccardNumber
        
        self.organizationId = App.loginRes?.organizationId?.description
        
        self.ticket = App.loginRes?.ticketString
        
    }
    
    var ccardNumber: String!
    
    var organizationId: String!
    
    var ticket : String!
    
    
    func getParams() -> [String: Any]{
        
        return ["ticket": ticket! , "organizationId": organizationId!  ,"ccardNumber" : ccardNumber!]
        
    }
    
}

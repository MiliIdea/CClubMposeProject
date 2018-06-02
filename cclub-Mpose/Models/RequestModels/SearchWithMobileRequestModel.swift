//
//  SearchWithMobileRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/27/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class SearchWithMobileRequestModel {
    
    init(mobileNumber : String!) {
        
        self.mobileNumber = mobileNumber
        
        self.organizationId = App.loginRes?.organizationId?.description
        
        self.ticket = App.loginRes?.ticketString
        
    }
    
    var mobileNumber: String!
    
    var organizationId: String!
    
    var ticket : String!
    
    
    func getParams() -> [String: Any]{
        
        return ["ticket": ticket! , "organizationId": organizationId!  ,"mobileNumber" : mobileNumber!]
        
    }
    
}

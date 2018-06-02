//
//  FindDuplicateRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/29/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class FindDuplicateRequestModel{
 
    init(branchID : String! , sourceDbId  : String! , isRejection : Bool) {
        
        self.organizationId = branchID
        
        self.sourceDbId = sourceDbId
        
        if(isRejection){
            self.eventTypeId = "1001"
        }else{
            self.eventTypeId = "1000"
        }
        
        self.ticket =  App.loginRes?.ticketString
        
        
    }
    
    var organizationId: String!
    
    var sourceDbId: String!
    
    var eventTypeId : String!
    
    var ticket : String!
    
    
    func getParams() -> [String: Any]{
        
        return ["organizationId": organizationId! , "sourceDbId": sourceDbId!  ,"eventTypeId" : eventTypeId! , "ticket" : ticket!]
        
    }
    
}

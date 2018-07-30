//
//  GetCreditUserRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/28/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class GetCreditUserRequestModel {
    
    init(ccardNumber : String!) {
        
        self.ccardNumber = ccardNumber
        
        self.personId = App.personID?.description
        
        self.ticket = App.loginRes?.ticketString
        
        self.posSerial = App.defaults.object(forKey: "serial") as! String
        
        
    }
    
    var personId: String!
    
    var ccardNumber: String!
    
    var ticket : String!
    
    var posSerial : String!
    
    func getParams() -> [String: Any]{
        
        return ["ticket": ticket! , "ccardNumber": ccardNumber!  ,"personId" : personId! , "posSerial" : posSerial!]
        
    }
    
}



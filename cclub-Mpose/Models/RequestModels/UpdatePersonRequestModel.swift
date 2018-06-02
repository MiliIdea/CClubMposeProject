//
//  UpdatePersonRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/28/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation


class UpdatePersonRequestModel {
    
    init(ccardNumber : String! , organizationId  : String! , firstName : String! , lastName : String! , mobileNumber : String! , sex : String! , birthDate : String! , personID : String!) {
        
        self.organizationId = organizationId
        
        self.firstName = firstName
        
        self.lastName = lastName
        
        self.ticket =  App.loginRes?.ticketString
        
        self.mobileNumber = mobileNumber
        
        self.sex = sex
        
        self.ccardNumber = ccardNumber
        
        self.birthDate = birthDate
        
        self.personID = personID
        
    }
    
    var personID : String!
    
    var organizationId: String!
    
    var firstName: String!
    
    var lastName : String!
    
    var ccardNumber : String!
    
    var ticket : String!
    
    var mobileNumber : String!
    
    var sex : String!
    
    var birthDate : String!
    
    func getParams() -> [String: Any]{
        
        return ["organizationId": organizationId! , "firstName": firstName!  ,"lastName" : lastName! , "ccardNumber" : ccardNumber! , "ticket" : ticket! , "mobileNumber" : mobileNumber! , "sex" :sex! , "birthDate" : birthDate! , "personId" : personID!]
        
    }
    
}

//
//  AssignCcardWithPersonRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/28/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

//{"organizationId":"100042","firstName":"ahmad","lastName":"ahmadi","ccardNumber":"","ticket":"tdemouser2|6791724192459473","mobileNumber":"09195651255","sex":"0","birthDate":"1370/03/13"}

class AssignCcardWithPersonRequestModel {
    
    init(ccardNumber : String! , organizationId  : String! , firstName : String! , lastName : String! , mobileNumber : String! , sex : String! , birthDate : String!) {
        
        self.organizationId = organizationId
        
        self.firstName = firstName
        
        self.lastName = lastName
        
        self.ticket =  App.loginRes?.ticketString
        
        self.mobileNumber = mobileNumber
        
        self.sex = sex
        
        self.ccardNumber = ccardNumber
        
        self.birthDate = birthDate
        
    }
    
    var organizationId: String!
    
    var firstName: String!
    
    var lastName : String!
    
    var ccardNumber : String!
    
    var ticket : String!
    
    var mobileNumber : String!
    
    var sex : String!
    
    var birthDate : String!
    
    func getParams() -> [String: Any]{
        
        return ["organizationId": organizationId! , "firstName": firstName!  ,"lastName" : lastName! , "ccardNumber" : ccardNumber! , "ticket" : ticket! , "mobileNumber" : mobileNumber! , "sex" :sex! , "birthDate" : birthDate!]
        
    }
    
}

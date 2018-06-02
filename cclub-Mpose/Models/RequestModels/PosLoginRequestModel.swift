//
//  PosLoginRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/27/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class PosLoginRequestModel {
    
    init(userName : String! , password : String!) {
        
        self.USERNAME = userName
        
        self.PASSWORD = password

        self.sessionString = App.defaults.object(forKey: "sessionString") as! String
        
    }
    
    var USERNAME: String!
    
    var PASSWORD: String!
    
    var sessionString: String!
    
    
    func getParams() -> [String: Any]{
        
        return ["username": USERNAME! , "password": PASSWORD!  ,"sessionString" : sessionString!]
        
    }
    
}

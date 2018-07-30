//
//  LoginRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/27/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class LoginRequestModel {
    
    init(userName : String! , password : String! , posSerial : String!) {
        
        self.USERNAME = userName
        
        self.PASSWORD = password
        
        self.MAC_ADDRESS = "4654354464656543"
        
        self.POS_SERIAL = posSerial

        
    }
    
    var USERNAME: String!
    
    var PASSWORD: String!
    
    var POS_SERIAL: String!
    
    var MAC_ADDRESS: String!

    
    func getParams() -> [String: Any]{
        
        return ["username": USERNAME! , "password": PASSWORD!  , "macAddress": MAC_ADDRESS! , "posSerial" : POS_SERIAL!]
        
    }
    
}

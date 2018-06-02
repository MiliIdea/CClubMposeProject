//
//  SaveManyToManyRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/28/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class SaveManyToManyRequestModel {
    
    init(personID : String , password : String , mobileNumber : String , firstName : String , lastName : String ,organizationID : String , sex : String) {
        organiz = ["canJoinInApp":false,"isMember":false,"rowId":organizationID]
        person =  ["rowId":personID]
        user = ["emailIsConfirmed":true,"fullName": firstName + " " + lastName ,"mobile": mobileNumber,"person":person,"rowId":0,"sex": sex,"userPassword":password,"username":mobileNumber,"ticket":App.loginRes?.ticketString!]
        listChild = [["organization":organiz,"role":["rowId":10003],"rowId":0]]
        self.param = ["listChild":listChild,"listId":[],"user":user]
        
    }

    var person : [String : Any]!
    var user : [String : Any]!
    var organiz : [String : Any]!
    var listChild : [[String : Any]]!
    var param : [String: Any]!
    
    func getParams() -> [String: Any]{
        
        return param
        
    }
    
}

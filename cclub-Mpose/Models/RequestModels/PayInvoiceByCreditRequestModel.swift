//
//  PayInvoiceByCreditRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/29/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class PayInvoiceByCreditRequestModel {
    
    init(ccardNumber : String! ,time : String! , date : String! , sourceDBId : String! , list : [CreditDetail]) {
        
        let invalidJson = ""
        do {
            var list2 : [[String : Any]] = [[String : Any]]()
            for lis in list {
                list2.append(lis.getParams())
            }
            let jsonData = try JSONSerialization.data(withJSONObject: list2, options: .prettyPrinted)
            let jsonList : String =  String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
            param = ["ccardNumber":ccardNumber,"ticket":(App.loginRes?.ticketString)!,"issueTime":time,"creditDetail": jsonList,"personId":(App.personID?.description)!,"issueDate":date,"sourceDbId":sourceDBId,"posSerial": (App.defaults.object(forKey: "serial") as! String!)]
        } catch {
            param = ["ccardNumber":ccardNumber,"ticket":(App.loginRes?.ticketString)!,"issueTime":time,"creditDetail": "","personId":(App.personID?.description)!,"issueDate":date,"sourceDbId":sourceDBId,"posSerial": (App.defaults.object(forKey: "serial") as! String!)]
        }
        
        
    }
    
    var param : [String : Any]!
    
    
    func getParams() -> [String: Any]{
        
        return param
        
    }
}

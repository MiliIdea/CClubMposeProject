//
//  AddInvoiceRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/29/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation


class AddInvoiceRequestModel {
    
    init(ccardNumber : String! , totalPrice  : String! , issueTime : String! , issueDate : String! ,sourceDbId : String! , creditAmount : String!) {
//        issueTime
        param = ["ccardNumber":ccardNumber,"ticket":(App.loginRes?.ticketString)! ,"totalPrice":totalPrice ,"issueTime":issueTime,"discount":"0","description":"","tax":"0","sourceDbId":sourceDbId,"referenceId":"","posSerial":(App.defaults.object(forKey: "serial") as! String!),"organizationId":(App.loginRes?.organizationId!.description)!,"personSourceDbId":"","eventTypeId":"1000","sourceDbReferenceId":"","eventAmount":totalPrice,"personId":(App.personID?.description)!,"details":"","creditAmount":creditAmount,"issueDate":issueDate,"organizationCashId":""]
        
    }
    
    var param : [String : Any]!
    
    
    
    func getParams() -> [String: Any]{
        
        return param
        
    }
    
}

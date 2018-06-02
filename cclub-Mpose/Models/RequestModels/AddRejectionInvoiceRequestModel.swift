//
//  AddRejectionInvoiceRequestModel.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/29/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class AddRejectionInvoiceRequestModel {
    
    init(ccardNumber : String! , totalPrice  : String! , issueTime : String! , issueDate : String! ,sourceDbId : String! , creditAmount : String! , referenceBranchId : String! , rejectionDbId : String!) {
        
        param = ["ccardNumber":ccardNumber,"ticket":(App.loginRes?.ticketString)! ,"totalPrice":totalPrice ,"issueTime":issueTime,"referenceBranchId" : referenceBranchId,"discount":"0","description":"","tax":"0","sourceDbId": rejectionDbId ,"referenceId":"","posSerial":(App.defaults.object(forKey: "serial") as! String!),"organizationId":(App.loginRes?.branchId!.description)!,"personSourceDbId":"","eventTypeId":"1001","sourceDbReferenceId":sourceDbId,"eventAmount":totalPrice,"personId":(App.personID?.description)!,"details":"","creditAmount":creditAmount,"issueDate":issueDate,"organizationCashId":""]
        
    }
    
    var param : [String : Any]!
    
    func getParams() -> [String: Any]{
        
        return param
        
    }
    
}

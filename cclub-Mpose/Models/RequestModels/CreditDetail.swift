//
//  CreditDetail.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/29/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

class CreditDetail {
    
    init(ccardSegmentId : CLongLong! , creditAmount  : CLongLong! , organizationId : CLongLong!) {
        
        self.ccardSegmentId = ccardSegmentId
        
        self.creditAmount = creditAmount
        
        self.organizationId = organizationId
        
        
    }
    
    var ccardSegmentId: CLongLong!
    
    var creditAmount: CLongLong!
    
    var organizationId : CLongLong!
    
    
    
    func getParams() -> [String: Any]{
        
        return ["ccardSegmentId": ccardSegmentId! , "creditAmount": creditAmount!  ,"organizationId" : organizationId!]
        
    }
    
}

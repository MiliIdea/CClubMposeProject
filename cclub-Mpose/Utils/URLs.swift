//
//  URLs.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/27/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

public class URLs {
    
    static let server = "http://my.c-club.ir/cclub/service/"
    
    static let login = server + "pos/posLogin"
    
    static let posLogin = server + "pos/posLoginBySessionString"
    
    static let searchWithMobile = server + "person/findPersonByMobileNoHaveCcardJson"
    
    static let searchWithCard = server + "person/findPersonByCcardNoOnOrganizationJson"
    
    static let getCredit = server + "rewardBalance/getCreditBalanceJson"
    
    static let assignCcardWithPerson = server + "ccardNA/AssignCcardWithPersonPropertyWithoutUser"
    
    static let saveManyToMany = server + "user/manyToManySave"
    
    static let updateUser = server + "person/updatePersonPublicAttr"
    
    static let payInvoiceByCredit = server + "reward/payInvoiceByCreditJson"
    
    static let addInvoice = server + "transactionMasterService/addInvoiceByDetail"
    
    static let findDuplicate = server + "vwEventTransactionService/findDuplicateTransaction"
    
    static let addRejection = server + "transactionMasterService/addRejectByDetailByInvoiceBranchId"
    
    static let findAllOrganization = server + "organization/findAllOrganizationChildsJSON"
    
    static let getRejectPrice = server + "transactionMasterService/getRejectPayedValue"
    
    
    
}

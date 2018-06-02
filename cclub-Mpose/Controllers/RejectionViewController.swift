//
//  RejectionViewController.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/29/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import DCKit
import Alamofire
import CodableAlamofire
import DropDown
import DateTimePicker

class RejectionViewController: UIViewController {

    
    @IBOutlet var factorNumber: UITextField!
    
    @IBOutlet var rejectionNumber: UITextField!
    
    @IBOutlet var factorAmount: UITextField!
    
    @IBOutlet var dropDownButton: DCBorderedButton!
    
    @IBOutlet var factorDateButton: UIButton!
    
    let dropDown = DropDown()
    
    var ccardNumber : String?
    
    var list : [AllOrganizationRes] = [AllOrganizationRes]()
    
    var strList : [String] = [String]()
    
    var selectedIndex : AllOrganizationRes?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dropDown.anchorView = self.dropDownButton
        
        for l in list {
            strList.append(l.fullTitle!)
        }
        dropDown.dismissMode = .onTap
        dropDown.dataSource = strList
        dropDown.width = self.dropDownButton.frame.width
        dropDown.reloadAllComponents()
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.dropDownButton.setTitle(item, for: .normal)
            self.selectedIndex = self.list[index]
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        dropDown.hide()
        self.view.viewWithTag(56)?.removeFromSuperview()
        self.view.endEditing(true)
    }
    
    
    @IBAction func factorDateClicked(_ sender: Any) {
        self.view.endEditing(true)
        let picker = DateTimePicker.show()
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.isDatePickerOnly = true // to hide time and show only date picker
        picker.tag = 56
        picker.completionHandler = { date in
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.calendar = Calendar(identifier: Calendar.Identifier.persian)
//            dateFormatterGet.locale = Locale(identifier: "fa_IR")
            dateFormatterGet.dateFormat = "yyyy/MM/dd HH:mm:ss"
            self.factorDateButton.setTitle(dateFormatterGet.string(from: date), for: .normal )
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func setRejection(_ sender: Any) {
        
        if(selectedIndex == nil){
            self.view.makeToast("لطفا فروشگاه خود را انتخاب کنید")
            return
        }
        if(self.factorNumber.text == "" || self.factorAmount.text == "" || self.factorDateButton.title(for: .normal) == ""){
            self.view.makeToast("لطفا همه ی فیلدها را پر کنید")
            return
        }
        
        callDublicate(isRejection: true)
        
    }
    
    
    
    @IBAction func clickDropDown(_ sender: Any) {
        
        dropDown.show()
        
    }
    
    
    func callAddInvoiceRejection(){
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        var l = App.showLoading(vc: self)
        
        let s = self.factorDateButton.title(for: .normal)
        
        let s2 = s?.split(separator: " ")
        
        let date = s2![0]
        
        let time = s2![1]
        
        request(URLs.addRejection, method: .post , parameters: AddRejectionInvoiceRequestModel.init(ccardNumber: self.ccardNumber!, totalPrice: self.factorAmount.text!, issueTime: (time.description), issueDate: (date.description) , sourceDbId: self.factorNumber.text! , creditAmount: "", referenceBranchId: (self.selectedIndex?.rowId?.description)!, rejectionDbId: self.rejectionNumber.text!).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<CLongLong>>) in
            
            let res = response.result.value
            l.disView()
            
            if(res != nil && (res?.done)!){
                
                l = App.showLoading(vc: self)
                
                request(URLs.getRejectPrice, method: .post , parameters: ["ticket": (App.loginRes?.ticketString)!,"transactionMasterId":(res?.result)!.description] , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response2 : DataResponse<ResponseModel<CLongLong>>) in
                    
                    let res2 = response2.result.value
                    l.disView()
                    
                    if(res2 != nil && (res2?.done)!){
                        self.view.makeToast("مبلغ " + (res2?.result?.description)! + " ریال برگردانده شود")
                    }
                    
                }
                
            }else{
                self.view.makeToast(res?.errorDesc)
            }
            
        }
        
    }
    

    
    func callDublicate(isRejection : Bool){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        
        request(URLs.findDuplicate, method: .post , parameters: FindDuplicateRequestModel.init(branchID: (App.loginRes?.branchId?.description)!, sourceDbId: self.rejectionNumber.text!, isRejection: isRejection).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<[RejectDuplicateRes]>>) in
            
            let res = response.result.value
            l.disView()
            
            if(res != nil && (res?.done)!){
                if(res?.resultCountAll != 0){
                    //tekrarie
                    self.view.makeToast("شماره فاکتور تکراری می باشد")
                }else{
                    self.callAddInvoiceRejection()
                }
            }
        }
    }
    
    
    @IBAction func logout(_ sender: Any) {
        App.defaults.set(nil, forKey: "username")
        App.defaults.set(nil, forKey: "password")
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: ViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    
    @IBAction func settings(_ sender: Any) {
        let vC : SettingsPopupViewController = (self.storyboard?.instantiateViewController(withIdentifier: "SettingsPopupViewController"))! as! SettingsPopupViewController
        self.addChildViewController(vC)
        vC.view.frame = self.view.frame
        self.view.addSubview(vC.view)
        vC.didMove(toParentViewController: self)
    }
    
    
    
}

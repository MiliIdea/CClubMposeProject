//
//  MainPageViewController.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/27/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import UICheckbox_Swift
import Alamofire
import CodableAlamofire
import DCKit
import PersianDatePicker
import DateTimePicker


class MainPageViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet var cardNumberF: UITextField!
    @IBOutlet var customerNameF: UITextField!
    @IBOutlet var customerfamilyNameF: UITextField!
    @IBOutlet var mobileNumberF: UITextField!
    @IBOutlet var manCheck: UICheckbox!
    @IBOutlet var womanCheck: UICheckbox!
    @IBOutlet var birthdateButton: UIButton!
    /////
    @IBOutlet var creditTable: UITableView!
    /////
    @IBOutlet var factorNumberF: UITextField!
    @IBOutlet var priceF: UITextField!
    @IBOutlet var factorDateButton: UIButton!
    
    
    @IBOutlet var tableBackView: UIView!
    @IBOutlet var underTableView: UIView!
    
    @IBOutlet var editButton: DCBorderedButton!
    var isInEditMode : Bool = false
    
    @IBOutlet var scrollView: UIScrollView!
    var creditsList : [GetCreditRes] = [GetCreditRes]()
    
    @IBOutlet var topTableView: UIView!
    @IBOutlet var viewInScrollView: UIView!
    
    @IBOutlet var undercardNumberView: UIView!
    
    @IBOutlet var cardNumberView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mobileNumberF.addTarget(self, action: #selector(MainPageViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        
        self.creditTable.delegate = self
        
        self.creditTable.dataSource = self
        
        self.creditTable.register(UINib(nibName: "CreditTableViewCell", bundle: nil), forCellReuseIdentifier: "CreditTableViewCell")
        
        self.calculateHeightOfScrollView()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        calculateHeightOfScrollView()
        checkEditMode()
        if(App.defaults.bool(forKey: "generateAutoFactorNumber")){
            factorNumberF.isEnabled = false
            factorNumberF.text = Date().timeIntervalSince1970.description.split(separator: ".")[0].description
        }else{
            factorNumberF.isEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.view.viewWithTag(55)?.removeFromSuperview()
        self.view.endEditing(true)
    }
    @IBAction func setWoman(_ sender: Any) {
        manCheck.isSelected = false
        womanCheck.isSelected = true
    }
    @IBAction func setMan(_ sender: Any) {
        manCheck.isSelected = true
        womanCheck.isSelected = false
    }
    @IBAction func birthdateClick(_ sender: Any) {
        
        let persianDatePicker = PersianDatePickerView(frame: CGRect(x: self.view.frame.width / 2 - 135, y: self.view.frame.height / 2 - 135, width: 270, height: 270))
        persianDatePicker.backgroundColor = UIColor.white
        persianDatePicker.tag = 55
        self.view.addSubview(persianDatePicker)
        persianDatePicker.onChange = { (year, month, day) in
            self.birthdateButton.setTitle("\(year)/\(month)/\(day)", for: .normal)
        }
        
    }
    //////////
    @IBAction func clear(_ sender: Any) {
        
        self.manCheck.isSelected = false
        self.womanCheck.isSelected = false
        self.customerNameF.text = ""
        self.customerfamilyNameF.text = ""
        self.cardNumberF.text = ""
        self.mobileNumberF.text = ""
        self.birthdateButton.setTitle("", for: .normal)
        if(App.defaults.bool(forKey: "generateAutoFactorNumber")){
            factorNumberF.text = Date().timeIntervalSince1970.description.split(separator: ".")[0].description
        }else{
            self.factorNumberF.text = ""
        }
        self.factorDateButton.setTitle("", for: .normal)
        self.priceF.text = ""
        App.personID = nil
        isInEditMode = false
        creditsList.removeAll()
        calculateHeightOfScrollView()
        checkEditMode()
        
    }
    @IBAction func search(_ sender: Any) {
        
        self.view.endEditing(true)
        
        if(mobileNumberF.text == "" && cardNumberF.text == ""){
           return
        }else if(mobileNumberF.text != "" ){
            //search with mobile
            searchWithMobile()
        }else{
            //serarch with cardNumber
            searchWithCardNumber()
        }
        
    }
    
    func searchWithMobile(){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        request(URLs.searchWithMobile, method: .post , parameters: SearchWithMobileRequestModel.init(mobileNumber: self.mobileNumberF.text!).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<[SearchRes]>>) in
            
            let res = response.result.value
            l.disView()
            print(res?.done)
            if(res != nil && (res?.done)!){
                self.setResultSearch(res: (res?.result![0])!)
            }else{
                self.view.makeToast(res?.errorDesc)
            }
            
        }
    }
    
    
    func searchWithCardNumber(){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        
        request(URLs.posLogin, method: .post , parameters: SearchWithCardRequestModel.init(ccardNumber: self.cardNumberF.text!).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<[SearchRes]>>) in
            
            let res = response.result.value
            l.disView()
            
            if(res != nil && (res?.done)!){
                self.setResultSearch(res: (res?.result![0])!)
            }else{
                self.view.makeToast(res?.errorDesc)
            }
            
        }
    }
    
    func setResultSearch(res : SearchRes){
        if(res.sex == 0){
            setMan("")
        }else{
            setWoman("")
        }
        self.customerNameF.text = (res.firstName ?? "")
        
        self.customerfamilyNameF.text = (res.lastName ?? "")
        
        self.cardNumberF.text = res.ccardNumber?.description
        
        self.mobileNumberF.text = res.mobileNumber?.description
        
        self.birthdateButton.setTitle(res.birthDate, for: .normal)
        
        App.personID = res.personId
        
        isInEditMode = true
        checkEditMode()
        callCredit()
    }
    
    func callCredit(){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        
        request(URLs.getCredit, method: .post , parameters: GetCreditUserRequestModel.init(ccardNumber: self.cardNumberF.text).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<[GetCreditRes]>>) in
            
            let res = response.result.value
            l.disView()
            
            if(res != nil && (res?.done)!){
                // inja vaqti hesab dashte bashe
                //bayad table doros she
                self.creditsList.removeAll()
                
                self.creditsList = (res?.result)!
                
                self.creditTable.reloadData()
                
                UIView.animate(withDuration: 0.2, delay: 0.2 , options: .curveEaseInOut, animations: {
                    
                    self.tableBackView.frame.size.height = CGFloat((res?.result?.count)!) * (35 / 667 * self.view.frame.height)
                    
                    self.calculateHeightOfScrollView()
                    
                },completion : nil)
                
            }
            
        }
    }
    
    
    func calculateHeightOfScrollView(){
        if(self.creditsList.count == 0){
            self.topTableView.alpha = 0
            self.tableBackView.alpha = 0
            self.underTableView.frame.origin.y = self.topTableView.frame.origin.y
            self.undercardNumberView.frame.size.height = self.underTableView.frame.origin.y + self.underTableView.frame.height + 200
        }else{
            self.topTableView.alpha = 1
            self.tableBackView.alpha = 1
            self.underTableView.frame.origin.y = self.tableBackView.frame.origin.y + self.tableBackView.frame.height + 10
            self.undercardNumberView.frame.size.height = self.underTableView.frame.origin.y + self.underTableView.frame.height + 200
        }
        if(App.defaults.bool(forKey: "showCardNumber")){
            self.undercardNumberView.frame.origin.y = self.cardNumberView.frame.origin.y + self.cardNumberView.frame.height
        }else{
            self.undercardNumberView.frame.origin.y = self.cardNumberView.frame.origin.y
        }
        self.scrollView.frame.size.height = self.view.frame.height
        self.viewInScrollView.frame.size.height = self.undercardNumberView.frame.origin.y + self.undercardNumberView.frame.height + 200
        self.viewInScrollView.frame.origin.y = 0
        self.scrollView.contentSize = self.viewInScrollView.frame.size
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(isInEditMode){
            isInEditMode = false
            checkEditMode()
        }
    }
    
    func checkEditMode(){
        if(isInEditMode){
            self.editButton.setTitle("ویرایش", for: .normal)
        }else{
            self.editButton.setTitle("ثبت مشتری", for: .normal)
        }
    }
    
    @IBAction func edit(_ sender: Any) {
        
        self.view.endEditing(true)
        
        if(customerNameF.text == "" || customerfamilyNameF.text == "" || mobileNumberF.text == "" || self.birthdateButton.title(for: .normal) == ""){
            self.view.makeToast("لطفا تمام فیلدها را پر کنید")
            return
        }
        
        if(isInEditMode){
            //inja bayad reste edit call she
            callEditUser()
        }else{
            //inja bayad reste sabte customer call she
//            callAddPerson()
            checkduplicate()
        }
        
    }
    
    func callEditUser(){
        self.view.endEditing(true)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        var sex = "0"
        if(self.womanCheck.isSelected){
            sex = "1"
        }
        request(URLs.updateUser, method: .post , parameters: UpdatePersonRequestModel.init(ccardNumber: self.cardNumberF.text!, organizationId: (App.loginRes?.organizationId!.description)!, firstName: self.customerNameF.text!, lastName: self.customerfamilyNameF.text!, mobileNumber: self.mobileNumberF.text!, sex: sex, birthDate: self.birthdateButton.title(for: .normal)!, personID: (App.personID?.description)!).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<CLongLong>>) in
            
            let res = response.result.value
            l.disView()
            
            if(res != nil && (res?.done)!){
                self.view.makeToast("مشتری با موفقیت بروزرسانی شد")
            }else{
                self.view.makeToast(res?.errorDesc)
            }
            
            
        }
    }
    
    func checkduplicate(){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        request(URLs.searchWithMobile, method: .post , parameters: SearchWithMobileRequestModel.init(mobileNumber: self.mobileNumberF.text!).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<[SearchRes]>>) in
            
            let res = response.result.value
            l.disView()
            print(res?.done)
            if(res != nil && (res?.done)!){
                if((res?.result?.count)! > 0){
                   self.view.makeToast("این کاربر موجود می باشد")
                }else{
                    self.callAddPerson()
                }
                
            }else{
                self.view.makeToast(res?.errorDesc)
            }
            
        }
    }
    
    func callAddPerson(){
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        var sex = "0"
        if(self.womanCheck.isSelected){
            sex = "1"
        }
        
        
        
        request(URLs.assignCcardWithPerson, method: .post , parameters: AssignCcardWithPersonRequestModel.init(ccardNumber: self.cardNumberF.text!, organizationId: (App.loginRes?.organizationId!.description)!, firstName: self.customerNameF.text!, lastName: self.customerfamilyNameF.text!, mobileNumber: self.mobileNumberF.text!, sex: sex, birthDate: self.birthdateButton.title(for: .normal) ?? "").getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<String>>) in
            let res = response.result.value
            if(res != nil && (res?.done)!){
                
                let s = res?.result?.split(separator: "|")
                let pID = s![0]
                let pass = s![1]
                request(URLs.saveManyToMany, method: .post , parameters: SaveManyToManyRequestModel.init(personID: pID.description, password: pass.description, mobileNumber: self.mobileNumberF.text!, firstName: self.customerNameF.text!, lastName: self.customerfamilyNameF.text!, organizationID: (App.loginRes?.organizationId!.description)!, sex: sex).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response2 : DataResponse<ResponseModel<CLongLong>>) in
                    
                    let res2 = response2.result.value
                    l.disView()
                    
                    if(res2 != nil && (res2?.done)!){
                        self.view.makeToast("مشتری با موفقیت ثبت شد")
                        self.search("")
                    }else{
                        self.view.makeToast(res2?.errorDesc)
                    }
                    
                }
                
            }else{
                l.disView()
                self.view.makeToast(res?.errorDesc)
            }
            
        }
        
    }
    
    
    //////////
    @IBAction func factorDate(_ sender: Any) {
        self.view.endEditing(true)
        let picker = DateTimePicker.show()
        picker.highlightColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 138.0/255.0, alpha: 1)
        picker.isDatePickerOnly = true // to hide time and show only date picker
        picker.completionHandler = { date in
            // do something after tapping done
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.calendar = Calendar(identifier: Calendar.Identifier.persian)
//            dateFormatterGet.locale = Locale(identifier: "fa_IR")
            dateFormatterGet.dateFormat = "yyyy/MM/dd HH:mm:ss"
            self.factorDateButton.setTitle(dateFormatterGet.string(from: date), for: .normal )
        }
        
    }
    //////////
    @IBAction func setFinal(_ sender: Any) {
        //ag form khali bashe bayad payam bede bege poresh konid
//        if(App.defaults.bool(forKey: "generateAutoFactorNumber")){
//            factorNumberF.isEnabled = false
//            factorNumberF.text = Date().timeIntervalSince1970.description.split(separator: ".")[0].description
//        }else{
//            factorNumberF.isEnabled = true
//        }
        self.view.endEditing(true)
        callDublicate(isRejection: false)
    }
    
    func callDublicate(isRejection : Bool){
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        
        request(URLs.findDuplicate, method: .post , parameters: FindDuplicateRequestModel.init(branchID: (App.loginRes?.branchId?.description)!, sourceDbId: self.factorNumberF.text, isRejection: isRejection).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<[LoginRes]>>) in
            
            let res = response.result.value
            l.disView()
            
            if(!isRejection){
                if(res != nil && (res?.done)!){
                    if(res?.resultCountAll != 0){
                        //tekrarie
                        self.view.makeToast("شماره فاکتور تکراری می باشد")
                    }else{
                        //tekrari nis
                        //hala check mikonim az creditesh dade ya na
                        if(self.creditsList.count == 0){
                            self.callAddInvoice(creditAmount: "0")
                        }else{
                            var list : [CreditDetail] = [CreditDetail]()
                            for i in 0...(self.creditsList.count - 1) {
                                let c : CreditTableViewCell = self.creditTable.cellForRow(at: IndexPath.init(row: i, section: 0)) as! CreditTableViewCell
                                if(c.payAmount.text != nil && c.payAmount.text != ""){
                                    if((Int(c.payAmount.text!))! > 0){
                                        let index = self.creditsList[i]
                                        list.append(CreditDetail.init(ccardSegmentId: index.ccardSegmentId!, creditAmount: CLongLong(c.payAmount.text!), organizationId: index.organizationId))
                                    }
                                }
                            }
                            if(list.count == 0){
                                self.callAddInvoice(creditAmount: "0")
                            }else{
                                self.callPayInvoiceByCredit(list : list)
                            }
                        }
                    }
                }
            }else{
                if(res != nil && (res?.done)!){
                    if(res?.resultCountAll != 0){
                        //tekrarie
                        self.view.makeToast("شماره فاکتور تکراری می باشد")
                    }else{
                        
                    }
                }
            }
        }
    }
    
    
    func callPayInvoiceByCredit(list : [CreditDetail]){
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        
        let s = self.factorDateButton.title(for: .normal)
        
        let s2 = s?.split(separator: " ")
        
        let date = s2![0]
        
        let time = s2![1]
        
        request(URLs.payInvoiceByCredit, method: .post , parameters: PayInvoiceByCreditRequestModel.init(ccardNumber: self.cardNumberF.text, time: (time.description), date: (date.description), sourceDBId: self.factorNumberF.text, list: list).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<CLongLong>>) in
            
            let res = response.result.value
            l.disView()
            var ca : CLongLong = 0
            for lis in list {
                ca += lis.creditAmount
            }
            if(res != nil && (res?.done)!){
                self.callAddInvoice(creditAmount: ca.description)
            }else{
                self.view.makeToast(res?.errorDesc)
            }
            
        }
        
    }
    
    
    func callAddInvoice(creditAmount : String!){
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        
        let s = self.factorDateButton.title(for: .normal)
        
        let s2 = s?.split(separator: " ")
        
        let date = s2![0]
        
        let time = s2![1]
        
        print(date.description)
        
        print(time.description)
        
        request(URLs.addInvoice, method: .post , parameters: AddInvoiceRequestModel.init(ccardNumber: self.cardNumberF.text!, totalPrice: self.priceF.text!, issueTime: (time.description), issueDate: (date.description) , sourceDbId: self.factorNumberF.text , creditAmount: creditAmount).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<CLongLong>>) in
            
            let res = response.result.value
            l.disView()
            
            self.search("")
            
            if(res != nil && (res?.done)!){
                self.view.makeToast("فاکتور با موفقیت ثبت شد")
            }else{
                self.view.makeToast(res?.errorDesc)
            }
            
        }
        
    }
    
    
    
    @IBAction func setRejection(_ sender: Any) {
        
        //bayad check she k search shode ya na
        if(App.personID == nil){
            self.view.makeToast("کاربر مورد نظر خود را جستجو کنید")
            return
        }
        
        //bayad searche maqazeharo inja zad
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let l = App.showLoading(vc: self)
        
        request(URLs.findAllOrganization, method: .post , parameters: ["organizationId":(App.loginRes?.organizationId!.description)!,"ticket": (App.loginRes?.ticketString)!] , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<[AllOrganizationRes]>>) in
            
            let res = response.result.value
            l.disView()
            
            if(res != nil && (res?.done)!){
                //inja bayad dataye maqazeharo pass dad b rejectionViewController
                
                let vC : RejectionViewController = (self.storyboard?.instantiateViewController(withIdentifier: "RejectionViewController"))! as! RejectionViewController
                vC.ccardNumber = self.cardNumberF.text!
                vC.list = (res?.result)!
                self.navigationController?.pushViewController(vC, animated: true)
            }
            
        }
        
        
        
        
        
    }
    
    ///////////
    @IBAction func logout(_ sender: Any) {
        
        App.defaults.set(nil, forKey: "username")
        App.defaults.set(nil, forKey: "password")
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func settings(_ sender: Any) {
        
        let vC : SettingsPopupViewController = (self.storyboard?.instantiateViewController(withIdentifier: "SettingsPopupViewController"))! as! SettingsPopupViewController
        self.addChildViewController(vC)
        vC.view.frame = self.view.frame
        self.view.addSubview(vC.view)
        vC.didMove(toParentViewController: self)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CreditTableViewCell = self.creditTable.dequeueReusableCell(withIdentifier: "CreditTableViewCell" , for: indexPath) as! CreditTableViewCell
        
        cell.creditName.text = self.creditsList[indexPath.row].ccardSegmentName
        
        cell.creditAmount.text = self.creditsList[indexPath.row].creditBalanceValue?.description
        
        cell.payAmount.text = ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35 / 667 * self.view.frame.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.creditsList.count
    }
    
    
    

}










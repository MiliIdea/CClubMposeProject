//
//  ViewController.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/26/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import Alamofire
import CodableAlamofire
import Toast_Swift
import UICheckbox_Swift

class ViewController: UIViewController {

    @IBOutlet var userNameF: UITextField!
    
    @IBOutlet var passwordF: UITextField!
    
    @IBOutlet var serialPosF: UITextField!
    
    @IBOutlet var rememberCheck: UICheckbox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(App.defaults.object(forKey: "sessionString") != nil){
            self.serialPosF.alpha = 0
        }
        
        if(App.defaults.bool(forKey: "rememberCheck")){
            rememberCheck.isSelected = true
            if(App.defaults.object(forKey: "username") != nil){
                self.userNameF.text = App.defaults.object(forKey: "username") as! String
            }
            if(App.defaults.object(forKey: "password") != nil){
                self.passwordF.text = App.defaults.object(forKey: "password") as! String
            }
            
        }else{
            rememberCheck.isSelected = false
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(App.defaults.object(forKey: "sessionString") != nil){
            self.serialPosF.alpha = 0
        }
        
        if(App.defaults.bool(forKey: "rememberCheck")){
            rememberCheck.isSelected = true
            if(App.defaults.object(forKey: "username") != nil){
                self.userNameF.text = App.defaults.object(forKey: "username") as! String
            }
            if(App.defaults.object(forKey: "password") != nil){
                self.passwordF.text = App.defaults.object(forKey: "password") as! String
            }
            
        }else{
            rememberCheck.isSelected = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        if(userNameF.text! == "" || passwordF.text! == ""){
            return
        }else if(App.defaults.object(forKey: "sessionString") == nil){
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let l = App.showLoading(vc: self)

            request(URLs.login, method: .post , parameters: LoginRequestModel.init(userName: self.userNameF.text! ,password : self.passwordF.text!, posSerial: self.serialPosF.text! ).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<LoginRes>>) in
                
                let res = response.result.value
                print(res)
                l.disView()
                
                if(res != nil && (res?.done)!){
                    
                    if(self.rememberCheck.isSelected){
                        App.defaults.set(true, forKey: "rememberCheck")
                        App.defaults.set(self.userNameF.text!, forKey: "username")
                        App.defaults.set(self.passwordF.text!, forKey: "password")
                    }else{
                        App.defaults.set(false, forKey: "rememberCheck")
                    }
                    
                    App.loginRes = res?.result
                    App.defaults.set(self.serialPosF.text, forKey: "serial")
                    App.defaults.set(res?.result?.sessionString, forKey: "sessionString")
                    
                    let vC : MainPageViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MainPageViewController"))! as! MainPageViewController
                    self.navigationController?.pushViewController(vC, animated: true)
                    
                }
            }
        }else{
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let l = App.showLoading(vc: self)

            request(URLs.posLogin, method: .post , parameters: PosLoginRequestModel.init(userName: self.userNameF.text! ,password : self.passwordF.text!).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<LoginRes>>) in
                
                let res = response.result.value
                print(res)
                l.disView()
                
                if(res != nil && (res?.done)!){
                    
                    if(self.rememberCheck.isSelected){
                        App.defaults.set(true, forKey: "rememberCheck")
                        App.defaults.set(self.userNameF.text!, forKey: "username")
                        App.defaults.set(self.passwordF.text!, forKey: "password")
                    }else{
                        App.defaults.set(false, forKey: "rememberCheck")
                    }
                    
                    App.loginRes = res?.result
                    App.defaults.set(res?.result?.sessionString, forKey: "sessionString")
                    
                    let vC : MainPageViewController = (self.storyboard?.instantiateViewController(withIdentifier: "MainPageViewController"))! as! MainPageViewController
                    self.navigationController?.pushViewController(vC, animated: true)
                    
                }
            }
        }
        
    }
    
    @IBAction func check(_ sender: Any) {
 
    }
    
}


/*
 
 let vC : FirstMapViewController = (self.storyboard?.instantiateViewController(withIdentifier: "FirstMapViewController"))! as! FirstMapViewController
 self.navigationController?.pushViewController(vC, animated: true)
 
 */

/*
 
 
 let decoder = JSONDecoder()
 decoder.dateDecodingStrategy = .secondsSince1970
 let l = App.showLoading(vc: self)
 
 request(URLs.posLogin, method: .post , parameters: PosLoginRequestModel.init(userName: self.userNameF.text! ,password : self.passwordF.text!).getParams() , encoding: JSONEncoding.default).responseDecodableObject(decoder: decoder) { (response : DataResponse<ResponseModel<LoginRes>>) in
 
 let res = response.result.value
 l.disView()
 
 if(res != nil && (res?.done)!){
 
 }
 
 }
 
 
 
 
 
 */









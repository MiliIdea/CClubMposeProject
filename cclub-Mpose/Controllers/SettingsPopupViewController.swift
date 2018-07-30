//
//  SettingsPopupViewController.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/29/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import UIKit
import UICheckbox_Swift

class SettingsPopupViewController: UIViewController {

    @IBOutlet var showCardNumberButton: UICheckbox!
    
    @IBOutlet var invitationCodeButton: UICheckbox!
    
    @IBOutlet var generateAutoFactorNumberButton: UICheckbox!
    
    @IBOutlet var serialLabel: UILabel!
    
    @IBOutlet var versionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(App.defaults.bool(forKey: "showCardNumber")){
            showCardNumberButton.isSelected = true
        }else{
            showCardNumberButton.isSelected = false
        }
        
        if(App.defaults.bool(forKey: "generateAutoFactorNumber")){
            generateAutoFactorNumberButton.isSelected = true
        }else{
            generateAutoFactorNumberButton.isSelected = false
        }
        
        serialLabel.text = App.defaults.object(forKey: "serial") as! String
        
        versionLabel.text = "نسخه ی اپلیکیشن : " + (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func set(_ sender: Any) {
        
        if(showCardNumberButton.isSelected){
            App.defaults.set(true, forKey: "showCardNumber")
        }else{
            App.defaults.set(false, forKey: "showCardNumber")
        }
        if(generateAutoFactorNumberButton.isSelected){
            App.defaults.set(true, forKey: "generateAutoFactorNumber")
        }else{
            App.defaults.set(false, forKey: "generateAutoFactorNumber")
        }
        
        if(self.parent?.isKind(of: MainPageViewController.self))!{
            (self.parent as! MainPageViewController).viewDidAppear(true)
        }
        self.parent?.view.makeToast("تغییرات با موفقیت ثبت شد")
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    

}

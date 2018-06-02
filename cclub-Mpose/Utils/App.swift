//
//  App.swift
//  cclub-Mpose
//
//  Created by MehrYasan on 5/27/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation
import UIKit

public class App {
    
    static let defaults: UserDefaults = UserDefaults.standard
    
    static var personID : CLongLong?
    
    static var loginRes : LoginRes?
    
    static func showLoading(vc : UIViewController) -> LoadingViewController{
        let loadingView : LoadingViewController = (vc.storyboard?.instantiateViewController(withIdentifier: "LoadingViewController"))! as! LoadingViewController
        vc.addChildViewController(loadingView)
        loadingView.view.frame = vc.view.frame
        vc.view.addSubview(loadingView.view)
        loadingView.didMove(toParentViewController: vc)
        return loadingView
    }
    
}

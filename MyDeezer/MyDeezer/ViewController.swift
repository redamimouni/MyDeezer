//
//  ViewController.swift
//  MyDeezer
//
//  Created by Dev on 29/09/2016.
//  Copyright © 2016 Dev. All rights reserved.
//

import UIKit
import CoreFoundation

class ViewController: UIViewController, DeezerSessionDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let deezerConnect = DeezerConnect.init(appId: Constants.DeezerAPI.API_APP_ID, andDelegate: self)
        DZRRequestManager.default().dzrConnect = deezerConnect

    }
    
    @IBAction func connectionBtnPushed(sender: UIButton){
        var permissions: [String] = [DeezerConnectPermissionEmail, DeezerConnectPermissionBasicAccess, DeezerConnectPermissionOfflineAccess, DeezerConnectPermissionManageLibrary, DeezerConnectPermissionListeningHistory]
        
    }
    
    func deezerDidLogin() {
        
    }
    
    func deezerDidNotLogin(_ cancelled: Bool) {
        
    }
    
    func deezerDidLogout() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


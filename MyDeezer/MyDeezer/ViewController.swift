//
//  ViewController.swift
//  MyDeezer
//
//  Created by Dev on 29/09/2016.
//  Copyright © 2016 Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DeezerSessionConnectionDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DeezerSession.sharedInstance.connectionDelegate = self

    }
    
    @IBAction func connectionBtnPushed(sender: UIButton){
        let permissions: [String] = [DeezerConnectPermissionEmail, DeezerConnectPermissionBasicAccess, DeezerConnectPermissionOfflineAccess, DeezerConnectPermissionManageLibrary, DeezerConnectPermissionListeningHistory]
        DeezerSession.sharedInstance.connectToDeezerWith(permissions: permissions)
    }
    
    func deezerSessionDidDisconnect() {
        
    }
    
    func deezerSessionDidConnect() {
        
    }
    
    func deezerSessionConnectionDidFailWith(error: Error) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


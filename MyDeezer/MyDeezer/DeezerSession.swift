//
//  DeezerSession.swift
//  MyDeezer
//
//  Created by Dev on 01/10/2016.
//  Copyright © 2016 Dev. All rights reserved.
//

import Foundation

protocol DeezerSessionConnectionDelegate: class {
    func deezerSessionDidConnect()
    func deezerSessionConnectionDidFailWith(error: Error)
    func deezerSessionDidDisconnect()
}

private let sharedSession = DeezerSession()

class DeezerSession : NSObject, DeezerSessionDelegate{
    
    var deezerConnect: DeezerConnect!
    weak var connectionDelegate: DeezerSessionConnectionDelegate?
    
    class var sharedInstance: DeezerSession {
        sharedSession.deezerConnect = DeezerConnect.init(appId: Constants.DeezerAPI.API_APP_ID, andDelegate: sharedSession)
        DZRRequestManager.default().dzrConnect = sharedSession.deezerConnect
        return sharedSession
    }
    
    func connectToDeezerWith(permissions: String...) {
        deezerConnect.authorize(permissions)
    }
    
    func disconnect(){
        deezerConnect.logout()
    }
    
    func logOut() {
        clearTokenAndExpirationDate()
        disconnect()
    }

    func isSessionValid() {
        deezerConnect.isSessionValid()
    }
    
    func deezerDidLogin() {
        print("deezer did login")
        save(token: deezerConnect.accessToken, expirationDate: deezerConnect.expirationDate, userId: deezerConnect.userId)
        connectionDelegate?.deezerSessionDidConnect()
    }
    
    func deezerDidNotLogin(_ cancelled: Bool) {
        print("Deezer did not login: " + (cancelled ? "Cancelled" : "Not Cancelled"))
    }
    
    func deezerDidLogout() {
        print("Deezer did logout")
        connectionDelegate?.deezerSessionDidDisconnect()
    }
    
    func save(token: String, expirationDate: Date, userId: String) {
        UserDefaults.standard.set(token, forKey: Constants.DeezerTokenKey.DEEZER_TOKEN_KEY)
        UserDefaults.standard.set(expirationDate, forKey: Constants.DeezerTokenKey.DEEZER_EXPIRATION_DATE_KEY)
        UserDefaults.standard.set(userId, forKey: Constants.DeezerTokenKey.DEEZER_USER_ID_KEY)
        UserDefaults.standard.synchronize()
    }
    
    func clearTokenAndExpirationDate() {
        UserDefaults.standard.removeObject(forKey: Constants.DeezerTokenKey.DEEZER_TOKEN_KEY)
        UserDefaults.standard.removeObject(forKey: Constants.DeezerTokenKey.DEEZER_EXPIRATION_DATE_KEY)
        UserDefaults.standard.removeObject(forKey: Constants.DeezerTokenKey.DEEZER_USER_ID_KEY)
        UserDefaults.standard.synchronize()
    }
}

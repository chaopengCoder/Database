//
//  AppDelegate.swift
//  Database
//
//  Created by chaopeng on 03/31/2022.
//  Copyright (c) 2022 chaopeng. All rights reserved.
//

import UIKit
import Database

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        updateRealmVersion()
        return true
    }

    
    func updateRealmVersion() {
        let info = Bundle.main.infoDictionary
        if let versionStr = info?["CFBundleShortVersionString"] as? String {
            let vs = versionStr
                .split(separator: ".")
                .map { (version) -> Substring in
                    var v = version
                    if v.count == 1 { v.append("0") }
                    return v
                }
                .joined()
            if let versionInt = UInt64(vs) {
                print("RealmVersion = \(versionInt)")
                RealmManager.update(realmVersion: versionInt)
            }
        }
    }

}


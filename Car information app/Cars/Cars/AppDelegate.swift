//
//  AppDelegate.swift
//  AppDelegate
//
//  Created by Trevor McNeil on 2/13/21.
//  Copyright © 2021 Trevor McNeil. All rights reserved.
//

import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //read in data files on app start up
        readDataFiles()     // Given in CarData
        
        return true
    }

}

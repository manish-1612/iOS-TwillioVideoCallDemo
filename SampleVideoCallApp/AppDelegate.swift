//
//  AppDelegate.swift
//  SampleVideoCallApp
//
//  Created by Manish Kumar on 14/12/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /*
         Live Keys
         ACCOUNT SID
         AC1e6a48dbdceb2f58a7f433ada499ea33
         AUTH TOKEN
         cb33986ef45dae77cf9dfbb53121ecb9

         Test Keys
         ACCOUNT SID
         ACc7cd60b3eb5b11aa9c74761fbc0153b2
         TEST AUTHTOKEN
         18e8e54351b66228ef2f5dcf2476a347

         FRIENDLY NAME BidrideVideoTest
         SID SKa03ec21407b41448454a2b5548806aa3
         KEY TYPE Standard
         SECRET DHJibaVSGMuP1pPOm84VJtgfPKNk1vvB
         */
        
        IQKeyboardManager.shared.enable = true

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


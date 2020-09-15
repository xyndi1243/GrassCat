//
//  AppDelegate.swift
//  GrassCat
//
//  Created by Xyndi on 2020/3/25.
//  Copyright © 2020 Xyndi. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
               
               do{
                   let _ = try Realm()
                  
               } catch{
                   print("Error initialisting new realm, \(error)")
               }

         let mainArray = realm.objects(MainData.self)
        
         if mainArray.count == 0 {
             
             let defaultMain = MainData(value:[0])
            let defaultSound = SoundData(value:[true])
             try! realm.write {
                 realm.add(defaultMain)
                realm.add(defaultSound)
             }
         }
         else{
        try! realm.write{
            realm.objects(MainData.self)[0].reviewStatus = false
        }
        }
        //GoogleADs
        GADMobileAds.configure(withApplicationID: "ca-app-pub-5920700831518359~5915661803")

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

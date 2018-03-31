//
//  AppDelegate.swift
//  Shortcut
//
//  Created by Fernando on 3/25/18.
//  Copyright © 2018 Specialist. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var vcsArray = [UIViewController]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mountainsVC = storyboard.instantiateViewController(withIdentifier: "mountainsVC") as! MountainsVC
        let spaceVC = storyboard.instantiateViewController(withIdentifier: "spaceVC") as! SpaceVC
        let oceanVC = storyboard.instantiateViewController(withIdentifier: "oceanVC") as! OceanVC
        
        vcsArray = [mountainsVC, spaceVC, oceanVC]
        return true
    }
    
    enum ShortcutType: String {
        case mountains = "mountains"
        case space = "space"
        case ocean = "ocean"
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVC = window?.rootViewController as! UITabBarController
            navVC.setViewControllers(vcsArray, animated: false)
            
            switch type {
            case ShortcutType.space.rawValue:
                navVC.selectedIndex = 1
                completionHandler(true)
            case ShortcutType.ocean.rawValue:
                navVC.selectedIndex = 2
                completionHandler(true)
            default:
                navVC.selectedIndex = 0
                completionHandler(true)
            }
        }
        
        completionHandler(false)
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


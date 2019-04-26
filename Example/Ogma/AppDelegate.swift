//
//  AppDelegate.swift
//  Ogma
//
//  Created by mathiasquintero on 04/23/2019.
//  Copyright (c) 2019 mathiasquintero. All rights reserved.
//

import UIKit
import Ogma

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        var input = """
        // Supports comments
        /*
            Also Multiline comments
        */
        {
            "success": true,
            "people": [
                {
                    "name": "Matt Mathias",
                    "age": 32,
                    "spouse": true
                },
                {
                    "name": "Sergeant Pepper",
                    "age": 25,
                    "spouse": false
                }
            ],
            "jobs": [
                "teacher",
                "judge"
            ],
            "states": {
                "Georgia": [
                    30301,
                    30302,
                    30303
                ],
                "Wisconsin": [
                    53000,
                    53001
                ]
            }
        }
        """
        let json: JSON = try! .parse(input)
        print(json)

        input = "king of the north #status = alive and #allegiance = Targaryen"
        let query: Query = try! .parse(input)
        print(query)


        input = """
        Hello, here's some JSON { \"Hello\": \"World\" }.
        It will parse numbers like 1234.
        I can inline a "String".
        And bools like true or false. Neat right?
        Even arrays [1, 2, 3, 4].
        """

        let annotated = try! JSON.annotate(input, using: JSON.Lexer.self)
        print(annotated)

        input = """
        Awesome #hackathon with @adnan! Such an awesome time #tum #hackatum
        """

        let tweet = try! Twitter.Lexer.annotate(input) as AnnotatedString<Twitter.Token>
        print(tweet)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


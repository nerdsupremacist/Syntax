//
//  AppDelegate.swift
//  Ogma
//
//  Created by mathiasquintero on 04/23/2019.
//  Copyright (c) 2019 mathiasquintero. All rights reserved.
//

import UIKit
import Ogma

private let runBenchmarks = false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        guard runBenchmarks else { return true }

        let query = "checking #status = 42 and #status = 30 and #status = 1 or #status = 0"
        let parsed = try! Query.parse(query)
        print(parsed)

        let jsonData = jsonString.data(using: .utf8)!
        let timeForFoundation = timeElapsedInSecondsWhenRunningCode(times: 20) {
            try! JSONSerialization.jsonObject(with: jsonData)
        }
        let timeForOgmaParser = timeElapsedInSecondsWhenRunningCode(times: 20) {
            try! JSON.parse(jsonString)
        }

        print("Foundation needed in average: \(timeForFoundation) seconds")
        print("Ogma needed in average: \(timeForOgmaParser) seconds")

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

private func timeElapsedInSecondsWhenRunningCode<Result>(times: Int, operation: @escaping () -> Result) -> TimeInterval {
    let values = Array(repeating: operation, count: times).map { timeElapsedInSecondsWhenRunningCode(operation: $0).1 }
    return values.reduce(0, +) / Double(values.count)
}

private func timeElapsedInSecondsWhenRunningCode<Result>(operation: () -> Result) -> (Result, TimeInterval) {
    let startTime = CFAbsoluteTimeGetCurrent()
    let value = operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    return (value, timeElapsed)
}

private let jsonString = """
[
{
"_id": "5d4e8b810e7ad360e1acffd9",
"index": 0,
"guid": "21d48d27-9520-497d-bacc-211df784f7f7",
"isActive": false,
"balance": "$3,118.63",
"picture": "http://placehold.it/32x32",
"age": 30,
"eyeColor": "brown",
"name": {
"first": "Norman",
"last": "Morris"
},
"company": "ENERVATE",
"email": "norman.morris@enervate.org",
"phone": "+1 (917) 491-2611",
"address": "719 Williams Avenue, Norwood, Nebraska, 6623",
"about": "Aute amet duis minim est fugiat ipsum labore dolore fugiat sunt ut ipsum. Veniam fugiat nulla laborum elit culpa do ea cillum dolore nulla officia ex excepteur incididunt. Et minim mollit veniam minim sunt exercitation mollit esse anim non nostrud amet. Est laboris ut id sint labore aute.",
"registered": "Sunday, April 19, 2015 2:42 AM",
"latitude": "30.998095",
"longitude": "44.634166",
"tags": [
"deserunt",
"anim",
"id",
"cillum",
"culpa"
],
"range": [
0,
1,
2,
3,
4,
5,
6,
7,
8,
9
],
"friends": [
{
"id": 0,
"name": "Bray Pacheco"
},
{
"id": 1,
"name": "Daphne Gay"
},
{
"id": 2,
"name": "Earline Waller"
}
],
"greeting": "Hello, Norman! You have 7 unread messages.",
"favoriteFruit": "apple"
},
{
"_id": "5d4e8b81c806f21d212fd2e7",
"index": 1,
"guid": "f6e07f1e-4fd8-41e8-8a36-72ef6332c5e0",
"isActive": true,
"balance": "$1,883.40",
"picture": "http://placehold.it/32x32",
"age": 39,
"eyeColor": "blue",
"name": {
"first": "Brewer",
"last": "May"
},
"company": "OPTICON",
"email": "brewer.may@opticon.tv",
"phone": "+1 (957) 595-3369",
"address": "204 Montague Street, Nord, Missouri, 4948",
"about": "Consectetur consequat proident sint consequat. Non ut incididunt aute ut reprehenderit amet et velit. Sit exercitation do aute eu esse dolore sint. Non duis excepteur aute nisi occaecat consequat fugiat culpa esse aliquip ad exercitation laboris. Irure qui anim aute aliquip fugiat sit id. Laborum dolore mollit in dolore id mollit aliqua nostrud velit et reprehenderit. Veniam sit elit aute ullamco amet deserunt incididunt voluptate.",
"registered": "Tuesday, November 29, 2016 12:33 AM",
"latitude": "73.76074",
"longitude": "-131.898521",
"tags": [
"culpa",
"est",
"Lorem",
"minim",
"tempor"
],
"range": [
0,
1,
2,
3,
4,
5,
6,
7,
8,
9
],
"friends": [
{
"id": 0,
"name": "Lola Elliott"
},
{
"id": 1,\
"name": "Medina Barlow"
},
{
"id": 2,
"name": "Toni Guerra"
}
],
"greeting": "Hello, Brewer! You have 6 unread messages.",
"favoriteFruit": "strawberry"
},
{
"_id": "5d4e8b81ffbfc039b8a68877",
"index": 2,
"guid": "1b677c17-bddd-4f2e-a037-e2779306bf8c",
"isActive": true,
"balance": "$3,658.66",
"picture": "http://placehold.it/32x32",
"age": 27,
"eyeColor": "blue",
"name": {
"first": "Rosa",
"last": "Callahan"
},
"company": "CEMENTION",
"email": "rosa.callahan@cemention.info",
"phone": "+1 (975) 498-3939",
"address": "619 Coles Street, Trinway, Wisconsin, 420",
"about": "Sint culpa excepteur aliquip consectetur elit nisi consequat ipsum excepteur. Irure officia cupidatat deserunt sunt consectetur reprehenderit occaecat cupidatat. Nulla minim aute pariatur enim in do nostrud.",
"registered": "Friday, January 5, 2018 3:59 AM",
"latitude": "35.282544",
"longitude": "-79.094084",
"tags": [
"qui",
"aliquip",
"laborum",
"mollit",
"in"
],
"range": [
0,
1,
2,
3,
4,
5,
6,
7,
8,
9
],
"friends": [
{
"id": 0,
"name": "Clare Leblanc"
},
{
"id": 1,
"name": "Jimmie Moses"
},
{
"id": 2,
"name": "Darla Bond"
}
],
"greeting": "Hello, Rosa! You have 6 unread messages.",
"favoriteFruit": "banana"
},
{
"_id": "5d4e8b813251eff89e3abd0f",
"index": 3,
"guid": "f17329a0-9ffd-45e1-9d44-375ff1c753b7",
"isActive": true,
"balance": "$2,827.70",
"picture": "http://placehold.it/32x32",
"age": 22,
"eyeColor": "green",
"name": {
"first": "Clarke",
"last": "Randall"
},
"company": "COMVEX",
"email": "clarke.randall@comvex.biz",
"phone": "+1 (940) 438-2138",
"address": "132 Barbey Street, Lodoga, Mississippi, 4698",
"about": "Est adipisicing tempor laborum eu voluptate ex mollit. Laborum proident eu mollit eiusmod. Cupidatat quis dolor laboris cupidatat irure dolor sit elit commodo irure. Deserunt tempor adipisicing elit minim. Proident sint ex minim voluptate sint qui proident reprehenderit eiusmod labore adipisicing adipisicing mollit duis.",
"registered": "Thursday, November 10, 2016 11:56 AM",
"latitude": "81.345141",
"longitude": "152.590849",
"tags": [
"commodo",
"culpa",
"eu",
"voluptate",
"nulla"
],
"range": [
0,
1,
2,
3,
4,
5,
6,
7,
8,
9
],
"friends": [
{
"id": 0,
"name": "Charity Fischer"
},
{
"id": 1,
"name": "Bennett Nixon"
},
{
"id": 2,
"name": "Gillespie Hardy"
}
],
"greeting": "Hello, Clarke! You have 6 unread messages.",
"favoriteFruit": "apple"
},
{
"_id": "5d4e8b813ac6c1e8111ba65a",
"index": 4,
"guid": "1f676d4f-4ec8-40d9-b2cf-68c94e9aa9d2",
"isActive": false,
"balance": "$3,227.29",
"picture": "http://placehold.it/32x32",
"age": 22,
"eyeColor": "blue",
"name": {
"first": "Sonia",
"last": "Walls"
},
"company": "COMFIRM",
"email": "sonia.walls@comfirm.us",
"phone": "+1 (834) 570-2458",
"address": "610 Bay Parkway, Rowe, Louisiana, 9137",
"about": "Pariatur sint enim ut dolore commodo fugiat labore mollit non nostrud magna eu in. Aute dolor do est ipsum sit officia veniam anim. Ut proident minim nostrud sint consequat in velit consectetur Lorem duis tempor velit exercitation. Voluptate pariatur magna minim excepteur ut aute eu eu culpa velit. Sit eiusmod sint qui labore sit aute commodo.",
"registered": "Saturday, April 11, 2015 5:13 PM",
"latitude": "38.370274",
"longitude": "54.262197",
"tags": [
"elit",
"esse",
"dolor",
"ea",
"ad"
],
"range": [
0,
1,
2,
3,
4,
5,
6,
7,
8,
9
],
"friends": [
{
"id": 0,
"name": "Michele Gates"
},
{
"id": 1,
"name": "Nell Barker"
},
{
"id": 2,
"name": "Sargent Burch"
}
],
"greeting": "Hello, Sonia! You have 6 unread messages.",
"favoriteFruit": "banana"
}
]
"""

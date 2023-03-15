//
//  iOSApp.swift
//  iOS
//
//  Created by Ricky Romero on 3/10/23.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
//        let scheme = "Dark"
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: scheme == "Dark" ? UIColor.white : UIColor.black]
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: scheme == "Dark" ? UIColor.white : UIColor.black]
//
//        let coloredAppearance = UINavigationBarAppearance()
//        coloredAppearance.configureWithTransparentBackground()
//        coloredAppearance.backgroundColor = scheme == "Dark" ? UIColor.black : UIColor.white
//        coloredAppearance.titleTextAttributes = [.foregroundColor: scheme == "Dark" ? UIColor.white : UIColor.black]
//        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: scheme == "Dark" ? UIColor.white : UIColor.black]
//
//        UINavigationBar.appearance().standardAppearance = coloredAppearance
//        UINavigationBar.appearance().compactAppearance = coloredAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        return true
    }
}

@main
struct iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var model = Model()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}

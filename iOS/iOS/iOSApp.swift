//
//  iOSApp.swift
//  iOS
//
//  Created by Ricky Romero on 3/10/23.
//

import SwiftUI

enum Update {
    case event(Event)
}

@MainActor
class Model: ObservableObject {
    @Published var view = ViewModel(user_name: "", scheme: "" )
    
    init() {
        update(msg: .event(.updateName("Ricky")))
        update(msg: .event(.updateScheme("Light")))
    }

    
    func update(msg: Update) {
        let reqs: [Request]
        switch msg {
            case let .event(m):
                reqs = try! [Request].bcsDeserialize(input: iOS.processEvent(try! m.bcsSerialize()))
        }
        
        for req in reqs {
            switch req.effect {
                case .render: view = try! ViewModel.bcsDeserialize(input: iOS.view())
            }
        }
    }

}

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
    @StateObject var model = Model()

    var body: some Scene {
        WindowGroup {
            ContentView(model: model).environmentObject(model)
        }
    }
}

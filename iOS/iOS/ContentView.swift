//
//  ContentView.swift
//  iOS
//
//  Created by Ricky Romero on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model: Model

    var body: some View {
        VStack {
//            HStack {
//                VStack{
//                    Text(String(model.view.user_name))
//                    Text(String(model.view.scheme))
//                }
//                Button(action: { 
//                    model.update(msg: .event(.updateScheme("Dark")))
//                }) {Label("Dark", systemImage: "moon")}
//                Button(action: {
//                    model.update(msg: .event(.updateScheme("Light")))
//                }) {Label("Light", systemImage: "moon")}
//            }
            TabView {
                HomeView(username: model.view.user_name, scheme: model.view.scheme)
                    .tabItem {
                        Label("", systemImage: "house.fill")
                    }
                ProfileView(username: model.view.user_name, scheme: model.view.scheme, update: self.model.update)
                    .tabItem {
                        Label("", systemImage: "person")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}

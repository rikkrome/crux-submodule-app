//
//  ContentView.swift
//  iOS
//
//  Created by Ricky Romero on 3/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("", systemImage: "house.fill")
                    }
                ProfileView()
                    .tabItem {
                        Label("", systemImage: "person")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let modelData = Model()
    static var previews: some View {
        ContentView().environmentObject(modelData)
    }
}

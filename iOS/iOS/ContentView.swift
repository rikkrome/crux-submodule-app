//
//  ContentView.swift
//  iOS
//
//  Created by Ricky Romero on 3/10/23.
//

import SwiftUI


enum Tab: Int {
       case ChatListView, HomeView, ProfileView
}

struct ContentView: View {
    @EnvironmentObject var model: Model
    @State private var selection = Tab.ChatListView
    @State private var tabBarVisible = true
    @State private var height = CGFloat.zero

    var body: some View {
        ZStack {
            NavigationStack {
                TabView(selection: $selection) {
                    ChatListView()
                        .tabItem {
                            Label("", systemImage: "message")
                        }.tag(Tab.ChatListView)
                    HomeView()
                        .tabItem {
                            Label("", systemImage: "house.fill")
                        }.tag(Tab.HomeView)
                    ProfileView()
                        .tabItem {
                            Label("", systemImage: "person")
                        }.tag(Tab.ProfileView)
                }
                .accentColor(.accentColor)
                .navigationDestination(for: MessagePreview.self) { message in
                    ChatRoomView()
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

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

class TabController: ObservableObject {
    @Published var activeTab = Tab.HomeView

    func open(_ tab: Tab) {
        withAnimation { activeTab = tab }
    }
}

struct ContentView: View {
    @EnvironmentObject var model: Model
    @StateObject private var tabController = TabController()
    @State private var tabBarVisible = true
    @State private var height = CGFloat.zero
    
    var body: some View {
        NavigationStack {
            TabView(selection: $tabController.activeTab) {
                ProfileView()
                    .tag(Tab.ProfileView)
                HomeView()
                    .tag(Tab.HomeView)
                ChatListView()
                    .tag(Tab.ChatListView)
                
            }
            .environmentObject(tabController)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .transition(.slide)
            .navigationDestination(for: MessagePreview.self) { message in
                ChatRoomView()
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

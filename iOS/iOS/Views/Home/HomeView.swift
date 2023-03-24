//
//  HomeView.swift
//  iOS
//
//  Created by Ricky Romero on 3/12/23.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: Model
    @EnvironmentObject private var tabController: TabController

    var body: some View {
                VStack {
                    HStack{
                        Button(action: {
                            tabController.open(.ProfileView)
                        }) {Label("", systemImage: "person.crop.circle.fill")}
                        Spacer()
                        Text("Home")
                        Spacer()
                        Button(action: {
                            tabController.open(.ChatListView)
                        }) {Label("", systemImage: "message.fill")}
                    }
                    .padding()
                    Spacer()
                    Text("Home")
                        .font(.headline)
                    Spacer()
                }
        }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TabView {
                HomeView().environmentObject(Model())
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }
}

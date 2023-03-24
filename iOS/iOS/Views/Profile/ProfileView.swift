//
//  ProfileView.swift
//  iOS
//
//  Created by Ricky Romero on 3/12/23.
//
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var model: Model
    @EnvironmentObject private var tabController: TabController
    var text_color: Color {
        model.view.settings.scheme == "Dark" ? .white : .black
    }
    func placeOrder() { }

    var body: some View {
            VStack {
                HStack{
                    Button(action: {
                        tabController.open(.HomeView)
                    }) {Label("", systemImage: "gearshape.fill")}
                    Spacer()
                    Text("Profile")
                    Spacer()
                    Button(action: {
                        tabController.open(.HomeView)
                    }) {Label("", systemImage: "arrow.right")}
                }
                .padding()
                ScrollView {
                    HStack{
                        Text("Hi \(model.view.profile.user_name) 👋")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                    }
                }
            }
//            .navigationBarItems(
//                trailing:
//                    Menu {
//                        Text("Setting")
//                        Menu {
//                            Button(action: {
//                                model.update(msg: .event(.updateScheme("Light")))
//                            }) {Label("Light", systemImage: "sun.max")}
//                            Button(action: {
//                                model.update(msg: .event(.updateScheme("Dark")))
//                            }) {Label("Dark", systemImage: "moon")}
//                        } label: {
//                            Text("Theme")
//                        }
//                    } label: {
//                        Label("Settings", systemImage: "gearshape").foregroundColor(text_color)
//                    }
//            )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TabView {
                ProfileView().environmentObject(Model())
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }
}

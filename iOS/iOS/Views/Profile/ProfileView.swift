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
                Menu {
                    Text("Setting")
                    Menu {
                        Button(action: {
                            model.update(msg: .event(.updateScheme("Light")))
                        }) {Label("Light", systemImage: "sun.max")}
                        Button(action: {
                            model.update(msg: .event(.updateScheme("Dark")))
                        }) {Label("Dark", systemImage: "moon")}
                    } label: {
                        Text("Theme")
                    }
                } label: {
                    Image(systemName: "gearshape")
                }
                Spacer()
                Button(action: {
                    tabController.open(.HomeView)
                }) {
                    Image(systemName: "arrow.right")
                }
            }
            .padding()
            ScrollView {
                    VStack {
                        ProfileImage(image: Image("dalle")).frame(width: 115, height: 115).padding(.top)
                        HStack {
                            Text("Romero").font(.title3).fontWeight(.bold)
                            Button(action: {
//                                model.update(msg: .event(.updateScheme("Light")))
                            }) {
                                Image(systemName: "square.and.arrow.up")
                            }
                            .buttonStyle(.borderedProminent)
                            .controlSize(.mini)
                        }
                    }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TabView {
                ProfileView().environmentObject(Model())
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

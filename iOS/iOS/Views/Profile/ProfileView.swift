//
//  ProfileView.swift
//  iOS
//
//  Created by Ricky Romero on 3/12/23.
//
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var model: Model
    var text_color: Color {
        model.view.settings.scheme == "Dark" ? .white : .black
    }
    func placeOrder() { }

    var body: some View {
        NavigationView {
            ZStack {
                Color(model.view.settings.scheme == "Dark" ? .black : .white)
                    .ignoresSafeArea()
                    .navigationTitle("Profile")
                    .navigationBarItems(
                        trailing:
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
                                Label("Settings", systemImage: "gearshape").foregroundColor(text_color)
                            }
                    )
                ScrollView {
                    HStack{
                        Text("Hi \(model.view.profile.user_name) 👋")
                            .foregroundColor(text_color)
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                        Spacer()
                    }
                }
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(Model())
    }
}

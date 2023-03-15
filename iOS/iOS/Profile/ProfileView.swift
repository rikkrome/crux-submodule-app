//
//  ProfileView.swift
//  iOS
//
//  Created by Ricky Romero on 3/12/23.
//
import SwiftUI

struct ProfileView: View {
    var username: String;
    var scheme: String;
    var updateThemeFunc: @MainActor (Update) -> ()
    private var bg_color: UIColor
    private var text_color: Color

    init(username: String, scheme: String, update: @escaping @MainActor (Update) -> ()) {
        print("username: \(username)")
        print("scheme: \(scheme)")
        self.username = username
        self.scheme = scheme
        self.updateThemeFunc = update
        
        self.bg_color = scheme == "Dark" ? .black : .white
        self.text_color = scheme == "Dark" ? .white : .black
        
    }
    
    func placeOrder() { }

    var body: some View {
        NavigationView {
            ZStack {
                Color(bg_color)
                    .ignoresSafeArea()
                    .navigationTitle("Profile")
                    .navigationBarItems(
                        trailing:
                            Menu {
                                Text("Setting")
//                                    .foregroundColor(text_color)
                                Menu {
                                    Button(action: {
                                        updateThemeFunc(.event(.updateScheme("Light")))
                                    }) {Label("Light", systemImage: "sun.max")}
                                    Button(action: {
                                        updateThemeFunc(.event(.updateScheme("Dark")))
                                    }) {Label("Dark", systemImage: "moon")}
                                } label: {
                                    Text("Theme")
                                }
                            } label: {
                                Label("Settings", systemImage: "gearshape")
//                                    .foregroundColor(text_color)
                            }
                    )
                ScrollView {
                    HStack{
                        Text("Hi \(username) 👋")
//                            .foregroundColor(text_color)
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
    static var username = Model().view.user_name
    static var scheme = Model().view.scheme
    static var update = Model().update
    
    static var previews: some View {
        ProfileView(username: username, scheme: scheme, update: update)
    }
}

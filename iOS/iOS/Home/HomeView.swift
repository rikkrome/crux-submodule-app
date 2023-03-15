//
//  HomeView.swift
//  iOS
//
//  Created by Ricky Romero on 3/12/23.
//
import SwiftUI

struct HomeView: View {
    var username: String;
    var scheme: String;
    private var bg_color: UIColor
    private var text_color: Color
    
    init(username: String, scheme: String) {
        print("username: \(username)")
        print("scheme: \(scheme)")
        self.username = username
        self.scheme = scheme
        self.bg_color = scheme == "Dark" ? .black : .white
        self.text_color = scheme == "Dark" ? .white : .black

    }
    
    var body: some View {
        ZStack{
            Color(scheme == "Dark" ? .black : .white)
            VStack {
                Text("Hi \(username.capitalized)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(text_color)
                Text("scheme: \(scheme.capitalized)")
                    .foregroundColor(text_color)
                
            }
        }
        .ignoresSafeArea()
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var username = Model().view.user_name
    static var scheme = Model().view.scheme
    static var previews: some View {
        HomeView(username: username, scheme: scheme)
    }
}

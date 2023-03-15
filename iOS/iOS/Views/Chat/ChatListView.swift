//
//  ChatListView.swift
//  iOS
//
//  Created by Ricky Romero on 3/14/23.
//

import SwiftUI

struct ChatListView: View {
    @EnvironmentObject var model: Model
    var text_color: Color {
        model.view.settings.scheme == "Dark" ? .white : .black
    }
    var body: some View {
        ZStack{
            Color(model.view.settings.scheme == "Dark" ? .black : .white)
            VStack {
                Text("Hi \(model.view.profile.user_name.capitalized)")
                    .foregroundColor(text_color)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text("scheme: \(model.view.settings.scheme.capitalized)").foregroundColor(text_color)
                
            }
        }
        .ignoresSafeArea()
    }
    
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Model())
    }
}



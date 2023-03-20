//
//  ChatListView.swift
//  iOS
//
//  Created by Ricky Romero on 3/14/23.
//

import SwiftUI

struct MessagePreview: Hashable {
    let user: String
    let message: String
    let time: String
}

struct ChatListView: View {
    @EnvironmentObject var model: Model
    
    let messages: [MessagePreview] = [
        .init(user: "Catherine", message: "Hi there, How's your work ? did you completed that cross platform app ? ", time: "10:30 AM"),
        .init(user:"Shezad", message: "Are you available tomorrow at 3:30 pm ? i'd like to discuss about our new project", time: "12:45 AM"),
        .init(user:"Afna", message: "Hey, is there any update for morning stand up meeting tomorrow ?", time: "12:15 PM"),
        .init(user:"Mathew", message: "Wow, awesome! Thank you so much for your effort", time: "4:30 AM"),
              .init(user:"Jerin", message: "Yeah, Let's meet tomrrow evening 5:30pm at coffe shop", time: "8:17 AM")]
    
    
    var text_color: Color {
        model.view.settings.scheme == "Dark" ? .white : .black
    }
    var body: some View {
        NavigationView {
            ZStack{
                Color(model.view.settings.scheme == "Dark" ? .black : .white)
                    .ignoresSafeArea()
                List {
                    ForEach(messages, id: \.self) { message in
                        ZStack {
                            ChatListRow(
                                username: message.user,
                                message: message.message,
                                time: message.time,
                                image: Image("dalle")
                            )
                            NavigationLink(value: message) {
                                EmptyView()
                            }
                            .buttonStyle(PlainButtonStyle())
                            .opacity(0.0)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Chat")
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView().environmentObject(Model())
    }
}



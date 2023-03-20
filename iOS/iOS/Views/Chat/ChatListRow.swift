//
//  ChatListRow.swift
//  iOS
//
//  Created by Ricky Romero on 3/14/23.
//

import SwiftUI

struct ChatListRow: View {
    var username: String
    var message: String
    var time: String
    var image: Image

    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                HStack {
                    Text(username)
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text(time)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .bold()
                }
                Text(message)
                    .font(.body)
            }
            
            Spacer()
        }
        .listRowSeparator(.hidden)
        .padding(4)
    }
}

struct ChatListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatListRow(username: "username", message: "message...", time: "8:17 AM", image: Image("dalle"))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

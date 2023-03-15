//
//  ChatListRow.swift
//  iOS
//
//  Created by Ricky Romero on 3/14/23.
//

import SwiftUI

struct ChatListRow: View {

    var body: some View {
        HStack {
            Text("Title")
        }
    }
}

struct ChatListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatListRow()
            ChatListRow()
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

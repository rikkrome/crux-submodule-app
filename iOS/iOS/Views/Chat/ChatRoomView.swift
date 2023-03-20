//
//  ChatRoomView.swift
//  iOS
//
//  Created by Ricky Romero on 3/15/23.
//

import SwiftUI

struct ChatBubble: Shape {
    var isSender: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: isSender ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: 15, height: 15))
        return Path(path.cgPath)
    }
}

struct ChatBubbleView: View {
    var message: String
    var isSender: Bool
    
    var body: some View {
        HStack {
            if isSender {
                Spacer()
            }
            
            Text(message)
                .padding(10)
                .background(ChatBubble(isSender: isSender).fill(isSender ? Color.blue : Color.gray))
                .foregroundColor(isSender ? .white : .black)
            
            if !isSender {
                Spacer()
            }
        }
        .padding(isSender ? .trailing : .leading, 10)
    }
}

struct Message: Identifiable {
    var id = UUID()
    var text: String
    var isSender: Bool
}


struct ChatRoomView: View {
    @EnvironmentObject var model: Model
    @State private var inputMessage: String = ""
    
    let messages: [Message] = [
        Message(text: "Hello, how are you?", isSender: false),
        Message(text: "I'm good, thanks! How about you?", isSender: true),
        Message(text: "Not bad, just working on a SwiftUI project. Not bad, just working on a SwiftUI project.", isSender: false),
        Message(text: "That sounds interesting! Good luck!", isSender: true)
    ]
    
    var text_color: Color {
        model.view.settings.scheme == "Dark" ? .white : .black
    }
    var body: some View {
        ZStack{
            Color(model.view.settings.scheme == "Dark" ? .black : .white)
            VStack {
                // MARK: List
                List(messages) { message in
                    HStack {
                        if message.isSender {
                            Spacer()
                        }
                        
                        ChatBubbleView(message: message.text, isSender: message.isSender)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        if !message.isSender {
                            Spacer()
                        }
                    }
                    .listRowSeparator(.hidden)
                    
                }
                .listStyle(.plain)
                // MARK: TextField
                HStack {
                    TextField("Type a message...", text: $inputMessage)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading)
                    
                    Button(action: {
                        // Send the message
                    }) {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing)
                    }
                }
                .padding(.bottom)
                
            }
        }
//        .navigationBarTitle("Chat Room", displayMode: .inline)
    }
    
}

struct ChatRoomView_Previews: PreviewProvider {
    static var previews: some View {
        ChatRoomView().environmentObject(Model())
    }
}


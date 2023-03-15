//
//  Model.swift
//  iOS
//
//  Created by Ricky Romero on 3/14/23.
//
import SwiftUI

enum Update {
    case event(Event)
}

@MainActor
class Model: ObservableObject {
    @Published var view = ViewModel(profile: Profile(user_name: "Ricky"), settings: Settings(scheme: "Light"))

    init() {
        update(msg: .event(.initViewModel(view)))
    }

    func update(msg: Update) {
        let reqs: [Request]
        switch msg {
            case let .event(m):
                reqs = try! [Request].bcsDeserialize(input: iOS.processEvent(try! m.bcsSerialize()))
        }
        
        for req in reqs {
            switch req.effect {
                case .render: view = try! ViewModel.bcsDeserialize(input: iOS.view())
            }
        }
    }

}

//
//  HomeView.swift
//  iOS
//
//  Created by Ricky Romero on 3/12/23.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: Model
    var text_color: Color {
        model.view.settings.scheme == "Dark" ? .white : .black
    }
    var body: some View {
                VStack {
                    Text("First View")
                        .font(.headline)
                        .foregroundColor(text_color)
                }
                .navigationTitle("Home")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(model.view.settings.scheme == "Dark" ? .black : .white)
        }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Model())
    }
}

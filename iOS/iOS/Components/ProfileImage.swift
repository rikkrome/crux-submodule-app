//
//  CircleImage.swift
//  iOS
//
//  Created by Ricky Romero on 3/14/23.
//

import SwiftUI
import PolyKit

struct ProfileImage: View {
    var image: Image
    var cornerRadius: CGFloat? = nil
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(
                ZStack {
                    Poly(count: 6, cornerRadius: cornerRadius ?? 20).rotationEffect(Angle(degrees: 90))
                }
            )
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(image: Image("dalle"), cornerRadius: 20).frame(width: 150, height: 150)
    }
}

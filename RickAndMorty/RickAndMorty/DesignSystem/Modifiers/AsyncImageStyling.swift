//
//  AsyncImageStyling.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import SwiftUI

extension Image {
    func asyncImageStyling(width: CGFloat = 150, height: CGFloat = 150, cornerRadius: CGFloat = 5) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .cornerRadius(cornerRadius)
    }
}

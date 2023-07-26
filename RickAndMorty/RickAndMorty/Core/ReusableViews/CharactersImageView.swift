//
//  CharactersImageView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import SwiftUI

struct CharactersImageView: View {
    let url: URL?

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .asyncImageStyling()
        } placeholder: {
            Image(systemName: SFSymbols.personCircleFilled.rawValue)
                .asyncImageStyling()
                .foregroundColor(.customTextColor)
        }
    }
}

struct CharactersImageView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersImageView(url: Character.mockCharacter.image)
    }
}

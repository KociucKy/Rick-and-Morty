//
//  CharactersListRowView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import SwiftUI

struct CharactersListRowView: View {
    let character: Character

    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .cornerRadius(13)
            VStack(spacing: 16) {
                CharactersImageView(url: character.image)
                VStack(spacing: 0) {
                    Text(character.name)
                        .font(.mulish(.headline, weight: .bold))
                    Text(character.species)
                        .font(.mulish(.subheadline, weight: .regular))
                }
                .foregroundColor(.customTextColor)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
            }
            .padding(8)
        }
    }
}

struct CharactersListRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListRowView(character: Character.mockCharacter)
            .padding(.horizontal, 16)
            .preferredColorScheme(.dark)
    }
}

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
        VStack {
            HStack(spacing: 16) {
                CharactersImageView(url: character.image)
                charactersInfoSection(name: character.name, species: character.species, status: character.status)
                    .foregroundColor(.customTextColor)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                Spacer()
            }
            Divider()
                .padding(.top, 8)
        }
        .padding(8)
    }

    private func characterStatusIndicator(status: CharacterStatus) -> some View {
        HStack(spacing: 4) {
            Circle()
                .frame(width: 8, height: 8)
            Text(status.rawValue)
        }
        .foregroundColor(status.getStatusColor())
    }

    private func charactersInfoSection(name: String, species: String, status: CharacterStatus) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .font(.mulish(.headline, weight: .bold))
            Group {
                Text(species)
                characterStatusIndicator(status: status)
            }
            .font(.mulish(.subheadline, weight: .regular))
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

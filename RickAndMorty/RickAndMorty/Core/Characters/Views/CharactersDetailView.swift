//
//  CharactersDetailView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import SwiftUI

enum CharacterDetails: CaseIterable, Identifiable {
    case status, type, gender, origin, location
    var id: Self {
        return self
    }

    // TODO: - Add to SFSymbols
    var icon: String {
        switch self {
        case .status:
            return "cross.fill"
        case .type:
            return "pawprint.fill"
        case .gender:
            return "person.fill"
        case .origin:
            return "house.fill"
        case .location:
            return "globe.europe.africa.fill"
        }
    }

    var key: String {
        switch self {
        case .status:
            return "Status:"
        case .type:
            return "Type:"
        case .gender:
            return "Gender:"
        case .origin:
            return "Origin:"
        case .location:
            return "Location:"
        }
    }

    func getKeyValue(character: Character) -> String {
        switch self {
        case .status:
            return character.status.rawValue
        case .type:
            return character.type
        case .gender:
            return character.gender.rawValue
        case .origin:
            return character.origin.name
        case .location:
            return character.location.name
        }
    }
}

struct CharactersDetailView: View {
    let character: Character

    var body: some View {
        VStack(spacing: 0) {
            charactersHeaderView()
            List {
                ForEach(CharacterDetails.allCases) { detail in
                    charactersInfoCell(charactersInfo: detail)
                }
            }
            .listStyle(.plain)
            .scrollDisabled(true)
            .padding(.top)
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func charactersHeaderView() -> some View {
        CharacterAvatarView(character: character, width: 200, height: 200)
            .padding(.bottom)
        Group {
            Text(character.name)
                .font(.mulish(.title, weight: .black))
            Text(character.species)
                .font(.mulish(.headline, weight: .semibold))
        }
        .foregroundColor(.customTextColor)
    }

    private func charactersInfoCell(charactersInfo: CharacterDetails) -> some View {
        HStack(spacing: 0) {
            Label(charactersInfo.key, systemImage: charactersInfo.icon)
            Spacer()
            Text(charactersInfo.getKeyValue(character: character))
        }
        .font(.mulish(.headline, weight: .regular))
        .foregroundColor(.customTextColor)
    }
}

struct CharactersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersDetailView(character: Character.mockCharacter)
    }
}

//
//  CharactersListRowView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import SwiftUI
import RealmSwift

struct CharactersListRowView: View {
    @EnvironmentObject var realmViewModel: RealmViewModel
    let character: Character?
    @ObservedRealmObject var realmCharacer: RealmCharacter

    init(character: Character) {
        self.character = character
        self.realmCharacer = RealmCharacter()
    }

    init(realmCharacter: RealmCharacter) {
        self.character = nil
        self.realmCharacer = realmCharacter
    }

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                if let character {
                    CharacterAvatarView(url: character.image)
                        .padding(.trailing, 16)
                    charactersInfoSection(name: character.name, species: character.species, status: character.status)
                        .foregroundColor(.customTextColor)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    Spacer()
                } else {
                    CharacterAvatarView(url: URL(string: realmCharacer.image ?? ""))
                        .padding(.trailing, 16)
                    charactersInfoSection(name: realmCharacer.name, species: realmCharacer.species)
                    Spacer()
                    Button {
                        realmViewModel.handleLikeActionOnRealmObject(character: realmCharacer)
                    } label: {
                        Image(systemName: realmViewModel.isLiked ? "heart.fill" : "heart")
                            .imageScale(.large)
                    }
                    .onAppear {
                        realmViewModel.checkStatusOnRealmObject(character: realmCharacer)
                    }
                }
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
            Text(status.rawValue.capitalized)
        }
        .foregroundColor(status.getStatusColor())
    }

    private func charactersInfoSection(name: String, species: String, status: CharacterStatus? = nil) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name)
                .font(.mulish(.headline, weight: .bold))
            Group {
                Text(species)
                if let status {
                    characterStatusIndicator(status: status)
                }
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

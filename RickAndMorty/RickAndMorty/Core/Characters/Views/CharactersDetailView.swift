//
//  CharactersDetailView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import SwiftUI

struct CharactersDetailView: View {
    @EnvironmentObject var realmViewModel: RealmViewModel
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
        .onAppear {
            realmViewModel.checkStatus(character: character)
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    realmViewModel.handleLikeAction(character: character)
                } label: {
                    Image(systemName: realmViewModel.isLiked ? "heart.fill" : "heart")
                }
            }
        }
    }

    @ViewBuilder
    private func charactersHeaderView() -> some View {
        CharacterAvatarView(url: character.image, width: 200, height: 200)
            .padding(.bottom)
        Group {
            Text(character.name)
                .font(.mulish(.title, weight: .black))
            Text(character.species)
                .font(.mulish(.headline, weight: .semibold))
        }
        .foregroundColor(.customTextColor)
    }

    @ViewBuilder
    private func charactersInfoCell(charactersInfo: CharacterDetails) -> some View {
        let value = charactersInfo.getKeyValue(character: character)
        HStack(spacing: 0) {
            Label(charactersInfo.key, systemImage: charactersInfo.icon)
            Spacer()
            Text(value.isEmpty ? "Not specified" : value)
        }
        .font(.mulish(.headline, weight: .regular))
        .foregroundColor(.customTextColor)
    }
}

struct CharactersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersDetailView(character: Character.mockCharacter)
            .environmentObject(RealmViewModel())
    }
}

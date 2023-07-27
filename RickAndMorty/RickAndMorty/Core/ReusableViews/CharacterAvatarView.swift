//
//  CharacterAvatarView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import SwiftUI

struct CharacterAvatarView: View {
    let character: Character
    var width: CGFloat = 100
    var height: CGFloat = 100

    var body: some View {
        CacheAsyncImage(url: character.image) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(width: width, height: height)
            case .success(let image):
                image
                    .asyncImageStyling(width: width, height: height)
                    .clipShape(Circle())
            case .failure:
                Image(systemName: SFSymbols.personCircleFilled.rawValue)
                    .asyncImageStyling(width: width, height: height)
                    .foregroundColor(.customTextColor)
            @unknown default:
                // TODO: - Error Handling
                fatalError()
            }
        }
    }
}

struct CharacterAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterAvatarView(character: Character.mockCharacter)
    }
}

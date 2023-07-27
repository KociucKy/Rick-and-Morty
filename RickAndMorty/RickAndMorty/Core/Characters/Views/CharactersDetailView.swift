//
//  CharactersDetailView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import SwiftUI

struct CharactersDetailView: View {
    let character: Character

    var body: some View {
        Text("Character's detail: \(character.name)")
    }
}

struct CharactersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersDetailView(character: Character.mockCharacter)
    }
}

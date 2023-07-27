//
//  RealmViewModel.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import Foundation
import RealmSwift

final class RealmViewModel: ObservableObject {
    @ObservedResults(RealmCharacter.self) var favoriteCharacters

    func addToFavorites(character: Character) {
        let realmCharacter = RealmCharacter(character: character)
        $favoriteCharacters.append(realmCharacter)
    }

    func removeFromFavorites(character: Character) {
        let objectToRemove = favoriteCharacters.first(where: { $0.id == character.id })
        if let objectToRemove {
            $favoriteCharacters.remove(objectToRemove)
        }
    }
}

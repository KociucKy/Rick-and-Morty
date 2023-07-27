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
    @Published var isLiked: Bool = false

    func checkStatus(character: Character) {
        let realmCharacter = RealmCharacter(character: character)
        checkStatusOnRealmObject(character: realmCharacter)
    }

    func checkStatusOnRealmObject(character: RealmCharacter) {
        let object = favoriteCharacters.first(where: { $0.id == character.id })
        if let _ = object {
            isLiked = true
        } else {
            isLiked = false
        }
    }

    private func addToFavorites(character: RealmCharacter) {
        $favoriteCharacters.append(character)
        self.objectWillChange.send()
    }

    private func removeFromFavorites(character: RealmCharacter) {
        let objectToRemove = favoriteCharacters.first(where: { $0.id == character.id })
        if let objectToRemove {
            $favoriteCharacters.remove(objectToRemove)
            self.objectWillChange.send()
        }
    }

    func handleLikeAction(character: Character) {
        let realmCharacter = RealmCharacter(character: character)
        handleLikeActionOnRealmObject(character: realmCharacter)
        checkStatus(character: character)
    }

    func handleLikeActionOnRealmObject(character: RealmCharacter) {
        let objectToPerformOn = favoriteCharacters.first(where: { $0.id == character.id })
        if let objectToPerformOn {
            removeFromFavorites(character: objectToPerformOn)
        } else {
            addToFavorites(character: character)
        }
    }
}

//
//  RealmCharacter.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import Foundation
import RealmSwift

final class RealmCharacter: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int = 99999
    @Persisted var name: String = ""
    @Persisted var status: String = ""
    @Persisted var species: String = ""
    @Persisted var image: String? = ""

    convenience init(character: Character) {
        self.init()
        self.id = character.id
        self.name = character.name
        self.status = character.status.rawValue
        self.species = character.species
        self.image = character.image?.absoluteString
    }
}

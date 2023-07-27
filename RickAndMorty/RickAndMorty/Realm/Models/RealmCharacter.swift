//
//  RealmCharacter.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import Foundation
import RealmSwift

final class RealmCharacter: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var status: String
    @Persisted var species: String
    @Persisted var type: String
    @Persisted var gender: String
    @Persisted var origin: String
    @Persisted var location: String
    @Persisted var image: String?

    convenience init(character: Character) {
        self.init()
        self.id = character.id
        self.name = character.name
        self.status = character.status.rawValue
        self.species = character.status.rawValue
        self.type = character.type
        self.gender = character.gender.rawValue
        self.origin = character.origin.name
        self.location = character.location.name
        self.image = character.image?.absoluteString
    }
}

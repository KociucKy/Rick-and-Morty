//
//  CharacterDetails.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import Foundation

enum CharacterDetails: CaseIterable, Identifiable {
    case status, type, gender, origin, location
    var id: Self {
        return self
    }

    var icon: String {
        switch self {
        case .status:
            return SFSymbols.crossFilled.rawValue
        case .type:
            return SFSymbols.pawprintFilled.rawValue
        case .gender:
            return SFSymbols.personFilled.rawValue
        case .origin:
            return SFSymbols.houseFilled.rawValue
        case .location:
            return SFSymbols.globeFilled.rawValue
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

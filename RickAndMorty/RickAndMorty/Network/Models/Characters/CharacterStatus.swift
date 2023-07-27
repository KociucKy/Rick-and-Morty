//
//  CharactersStatus.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import SwiftUI

enum CharacterStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"

    func getStatusColor() -> Color {
        switch self {
        case .alive:
            return Color.green
        case .dead:
            return Color.red
        case .unknown:
            return Color.yellow
        }
    }
}

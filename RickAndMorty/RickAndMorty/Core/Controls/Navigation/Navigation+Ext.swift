//
//  Navigation+Ext.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import SwiftUI

extension View {
    func withAppRouter() -> some View {
        self.navigationDestination(for: Router.Destination.self) { destination in
            switch destination {
            case let .detail(character):
                CharactersDetailView(character: character)
            case .location:
                Text("Location")
            }
        }
    }
}

//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import SwiftUI

@main
struct AppEntry: App {
    let charactersWebService = CharactersWebService(httpClient: URLSession(configuration: .default))

    var body: some Scene {
        WindowGroup {
            TabBarView(charactersWebService: charactersWebService)
        }
    }
}

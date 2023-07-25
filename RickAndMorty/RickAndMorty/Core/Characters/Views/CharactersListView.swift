//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 25/07/2023.
//

import SwiftUI

struct CharactersListView: View {
    var body: some View {
        NavigationStack {
            Text("All characters")
                .font(.largeTitle)
                .navigationTitle("Characters")
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}

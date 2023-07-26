//
//  AllCharactersInfo.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import Foundation

struct AllCharactersInfo {
    let count: Int
    let pages: Int
    let next: URL?
    let prev: URL?

    init(count: Int, pages: Int, next: URL?, prev: URL?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}

extension AllCharactersInfo {
    init(apiItem: APIAllCharactersInfo) {
        self.init(
            count: apiItem.count,
            pages: apiItem.pages,
            next: URL(string: apiItem.next ?? ""),
            prev: URL(string: apiItem.prev ?? "")
        )
    }
}

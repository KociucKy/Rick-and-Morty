//
//  CacheAsyncImage.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 27/07/2023.
//

import SwiftUI

// swiftlint: disable private_over_fileprivate
fileprivate final class ImageCache {
    static private var cache: [URL: Image] = [:]

    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}

struct CacheAsyncImage<Content>: View where Content: View {
    private let url: URL?
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content

    init(
        url: URL?,
        scale: CGFloat = 1.0,
        transaction: Transaction =  Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }

    var body: some View {
        if let url, let cached = ImageCache[url] {
            content(.success(cached))
        } else if let url {
            AsyncImage(url: url, scale: scale, transaction: transaction) { phase in
                cacheAndRender(phase: phase)
            }
        }
    }

    private func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if let url, case .success(let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}

struct CacheAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CacheAsyncImage(url: Character.mockCharacter.image) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .progressViewStyle(.circular)
            case .success(let image):
                image
            case .failure:
                Image(systemName: SFSymbols.personCircleFilled.rawValue)
                    .asyncImageStyling()
                    .foregroundColor(.customTextColor)
            @unknown default:
                fatalError()
            }
        }
    }
}

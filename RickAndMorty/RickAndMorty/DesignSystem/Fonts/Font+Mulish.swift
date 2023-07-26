//
//  Font+Mulish.swift
//  RickAndMorty
//
//  Created by Kuba Kociucki on 26/07/2023.
//

import SwiftUI

extension Font {
    enum MulishWeight {
        case black, bold, light, regular, semibold

        var fontName: String {
            switch self {
            case .black:
                return "Mulish-Black"
            case .bold:
                return "Mulish-Bold"
            case .light:
                return "Mulish-Light"
            case .regular:
                return "Mulish-Regular"
            case .semibold:
                return "Mulish-SemiBold"
            }
        }
    }

    static func mulishFontSize(_ textStyle: Font.TextStyle) -> CGFloat {
        var fontSize: CGFloat = 20

        switch textStyle {
        case .largeTitle:
            fontSize = 34
        case .title:
            fontSize = 24
        case .title2:
            fontSize = 22
        case .title3:
            fontSize = 20
        case .headline:
            fontSize = 18
        case .body:
            fontSize = 17
        case .callout:
            fontSize = 16
        case .subheadline:
            fontSize = 15
        case .footnote:
            fontSize = 13
        case .caption:
            fontSize = 12
        case .caption2:
            fontSize = 11
        @unknown default:
            fontSize = 20
        }

        return fontSize
    }

    static func mulish(_ textStyle: Font.TextStyle, weight: MulishWeight, dynamicType: Bool = true) -> Font {
        let fontSize: CGFloat = Font.mulishFontSize(textStyle)

        if dynamicType {
            return Font.custom(weight.fontName, size: fontSize, relativeTo: textStyle)
        }
        return Font.custom(weight.fontName, size: fontSize)
    }
}

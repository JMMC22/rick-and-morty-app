//
//  Fonts.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import SwiftUI

enum FontType: String {
    case inter

    var name: String {
        self.rawValue.capitalized
    }
}

enum FontWeight: String {
    case thinItalic
    case thin
    case regular
    case mediumItalic
    case medium
    case lightItalic
    case light
    case italic
    case boldItalic
    case bold
    case backItalic
    case black

    var name: String {
        "-" + self.rawValue.capitalized
    }
}

extension Font {
    static func font(type: FontType, weight: FontWeight, size: CGFloat) -> Font {
        .custom(type.name + weight.name, size: size)
    }
}

extension UIFont {
    class func font(type: FontType, weight: FontWeight, size: CGFloat) -> UIFont {
        return UIFont(name: type.name + weight.name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

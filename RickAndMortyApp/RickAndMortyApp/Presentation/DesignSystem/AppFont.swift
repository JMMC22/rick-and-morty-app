//
//  AppFont.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import UIKit
import SwiftUI

struct AppFont {

    let font: UIFont

    static func Roboto(_ size: CGFloat, weight: FontWeight) -> AppFont {
        let font = UIFont.font(type: .inter, weight: weight, size: size)
        return AppFont(font: font)
    }
}

struct AppFontModifier: ViewModifier {

    let font: AppFont
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(Font(self.font.font))
            .foregroundColor(color)
    }
}

extension View {
    func AppFont(_ font: AppFont, color: Color) -> some View {
        modifier(AppFontModifier(font: font, color: color))
    }
}

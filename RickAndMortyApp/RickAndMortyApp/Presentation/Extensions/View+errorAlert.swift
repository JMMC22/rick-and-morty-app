//
//  View+ErrorAlert.swift
//  RickAndMortyApp
//
//  Created by José María Márquez Crespo on 4/9/24.
//

import Foundation
import SwiftUI

extension View {
    func errorAlert(error: Binding<AppError?>, buttonTitle: String = "OK") -> some View {
        return alert(isPresented: .constant(error.wrappedValue != nil)) {
            Alert(
                title: Text("Error"),
                message: Text(error.wrappedValue?.localized ?? "error.generic"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

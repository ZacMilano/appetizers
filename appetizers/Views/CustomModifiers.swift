//
//  CustomModifiers.swift
//  appetizers
//
//  Created by Zac Milano on 12/10/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.accent)
            .controlSize(.large)
    }
}

// Debated between putting this in Utils/Extensions or in here. Functionally,
// it's used as a custom modifier, for styles, so I'm keeping it here.
extension Image {
    func AppetizerListImage() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120)
            .cornerRadius(8)
    }
}

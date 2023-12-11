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

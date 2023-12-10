//
//  AppetizerButton.swift
//  appetizers
//
//  Created by Zac Milano on 12/5/23.
//

import SwiftUI

struct AppetizerButton: View {
    // can have string formatting specifier
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(.accent)
            .cornerRadius(10)
    }
}

#Preview {
    AppetizerButton(title: "Button Text")
}

//
//  Order.swift
//  appetizers
//
//  Created by Zac Milano on 12/9/23.
//

import SwiftUI

final class Order: ObservableObject {
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
}

//
//  appetizersApp.swift
//  appetizers
//
//  Created by Zac Milano on 12/3/23.
//

import SwiftUI

@main
struct appetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}

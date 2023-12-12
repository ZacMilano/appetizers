//
//  AppetizerTabView.swift
//  appetizers
//
//  Created by Zac Milano on 12/3/23.
//

import SwiftUI

// 10:26:32
struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}

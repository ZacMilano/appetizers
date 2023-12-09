//
//  OrderView.swift
//  appetizers
//
//  Created by Zac Milano on 12/3/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.delete)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed!")
                    } label: {
                        AppetizerButton(
                            title: "$\(order.totalPrice, specifier: "%.2f") - Place Order"
                        )
                    }
                    .padding(.bottom, 20)
                }
                
                if order.items.isEmpty {
                    EmptyState(
                        imageName: "empty-order",
                        message: "You have no items in your order.\nPlease add an appetizer!"
                    )
                }
            }
            .navigationTitle("🧾 Current Order")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}

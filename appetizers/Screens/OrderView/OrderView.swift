//
//  OrderView.swift
//  appetizers
//
//  Created by Zac Milano on 12/3/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed!")
                    } label: {
                        AppetizerButton(title: "$39.92 - Place Order")
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
}

//
//  OrderView.swift
//  appetizers
//
//  Created by Zac Milano on 12/3/23.
//

import SwiftUI

struct OrderView: View {
    @State private var orderItems = MockData.orderItems
    
    func deleteItems(at offsets: IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orderItems) { appetizer in
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
                
                if orderItems.isEmpty {
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

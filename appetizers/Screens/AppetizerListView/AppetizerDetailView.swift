//
//  AppetizerDetailView.swift
//  appetizers
//
//  Created by Zac Milano on 12/4/23.
//

import SwiftUI

// 9:24:59
struct AppetizerDetailView: View {
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(label: "Calories", value: appetizer.calories)
                    NutritionInfo(label: "Protein", value: appetizer.protein)
                    NutritionInfo(label: "Carbs", value: appetizer.carbs)
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetailView = false
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom, 30)
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetailView = false
            } label: {
                DismissButton()
            },
            alignment: .topTrailing
        )
    }
}

struct NutritionInfo: View {
    let label: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(label)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailView(
        appetizer: MockData.sampleAppetizer,
        isShowingDetailView: .constant(true)
    )
    .environmentObject(Order())
}

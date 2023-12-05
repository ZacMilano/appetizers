//
//  AppetizerListView.swift
//  appetizers
//
//  Created by Zac Milano on 12/3/23.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedAppetizer: Appetizer?
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }
                .navigationTitle("🍗 Appetizers")
                .disabled(isShowingDetail)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(
                    title: alertItem.title,
                    message: alertItem.message,
                    dismissButton: alertItem.dismissButton
                )
            }
            
            if isShowingDetail {
                AppetizerDetailView(
                    appetizer: selectedAppetizer!,
                    isShowingDetailView: $isShowingDetail
                )
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

#Preview {
    AppetizerListView()
}

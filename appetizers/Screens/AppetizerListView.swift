//
//  AppetizerListView.swift
//  appetizers
//
//  Created by Zac Milano on 12/3/23.
//

import SwiftUI

struct AppetizerListView: View {
    @State private var appetizers: [Appetizer] = []
    
    var body: some View {
        NavigationView {
            List(appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍗 Appetizers")
        }
        .onAppear {
            getAppetizers()
        }
    }
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            // Network calls are on the background thread; this is causing a UI
            // update, so we put it on the main thread
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    AppetizerListView()
}

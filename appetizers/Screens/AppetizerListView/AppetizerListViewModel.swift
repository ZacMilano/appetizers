//
//  AppetizerListViewModel.swift
//  appetizers
//
//  Created by Zac Milano on 12/4/23.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    
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

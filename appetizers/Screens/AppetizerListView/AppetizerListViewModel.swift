//
//  AppetizerListViewModel.swift
//  appetizers
//
//  Created by Zac Milano on 12/4/23.
//

import SwiftUI

// Main-thread actor
@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
                
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
//        NetworkManager.shared.getAppetizers { result in
//            // Network calls are on the background thread; this is causing a UI
//            // update, so we put it on the main thread
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                        
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                        
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
    }
}

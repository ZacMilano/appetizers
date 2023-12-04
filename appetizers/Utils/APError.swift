//
//  APError.swift
//  appetizers
//
//  Created by Zac Milano on 12/4/23.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

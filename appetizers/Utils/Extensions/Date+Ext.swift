//
//  Date+Ext.swift
//  appetizers
//
//  Created by Zac Milano on 12/15/23.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTwentyYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -120, to: Date())!
    }
}

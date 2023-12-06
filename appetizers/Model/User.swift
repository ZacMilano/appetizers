//
//  User.swift
//  appetizers
//
//  Created by Zac Milano on 12/6/23.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}

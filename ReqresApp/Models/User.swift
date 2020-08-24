//
//  User.swift
//  ReqresApp
//
//  Created by Jozef Budac on 24/08/2020.
//  Copyright © 2020 Jozef Budac. All rights reserved.
//

import Foundation

struct User : Decodable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String

}



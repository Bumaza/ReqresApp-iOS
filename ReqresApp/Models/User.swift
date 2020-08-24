//
//  User.swift
//  ReqresApp
//
//  Created by Jozef Budac on 24/08/2020.
//  Copyright © 2020 Jozef Budac. All rights reserved.
//

import Foundation

struct User : Decodable, Identifiable {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
    
    init(){
        id = 0
        email = ""
        firstName = ""
        lastName = ""
        avatar =  ""
    }
    

    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
}



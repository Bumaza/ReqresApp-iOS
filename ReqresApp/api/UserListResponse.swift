//
//  UserResponse.swift
//  ReqresApp
//
//  Created by Jozef Budac on 24/08/2020.
//  Copyright © 2020 Jozef Budac. All rights reserved.
//

import Foundation

struct UserListResponse : Decodable {
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var data: [User]
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
}

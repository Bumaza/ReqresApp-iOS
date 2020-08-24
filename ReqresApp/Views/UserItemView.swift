//
//  UserItemView.swift
//  ReqresApp
//
//  Created by Jozef Budac on 24/08/2020.
//  Copyright © 2020 Jozef Budac. All rights reserved.
//

import Foundation
import SwiftUI

struct UserItemView : View {
    
    var user: User

    var body: some View {
        NavigationLink(destination: UserDetailView(userID: user.id)){
            HStack {
                ImageView(withURL: user.avatar).cornerRadius(10).padding()
                VStack {
                    Text(user.firstName + " " + user.lastName)
                    Text(user.email)
                }
            }
        }
    }
}

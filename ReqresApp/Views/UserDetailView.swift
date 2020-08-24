//
//  UserDetailView.swift
//  ReqresApp
//
//  Created by Jozef Budac on 24/08/2020.
//  Copyright © 2020 Jozef Budac. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire

struct UserDetailView : View {
    
    @ObservedObject var observed = UserDetailObserver()

    var userID:Int

    var body: some View {
        VStack {
            ImageView(withURL: observed.user.avatar).cornerRadius(10).padding()
            Text(observed.user.firstName + " " + observed.user.lastName)
            Text(observed.user.email)
        }
    }
    
    class UserDetailObserver : ObservableObject{
        @Published var user: User = User()

        init() {
            getUserDetail()
        }
        
        func getUserDetail(userID : Int = 1) {
            AF.request("https://reqres.in/api/users/\(userID)")
                .responseDecodable(of: UserDetailResponse.self) {
                    (response) in
                    guard let userDetailResponse : UserDetailResponse = response.value else {return}
                    self.user = userDetailResponse.data
            }
        }
    }
}

//
//  ContentView.swift
//  ReqresApp
//
//  Created by Jozef Budac on 10/08/2020.
//  Copyright © 2020 Jozef Budac. All rights reserved.
//

import SwiftUI
import Alamofire


struct ContentView: View {
    @ObservedObject var observed = Observer()
        
        var body: some View {
            NavigationView{
                List(observed.users){ i in
                    UserItemView(user: i)
                    }.navigationBarItems(
                      trailing: Button(action: addUser, label: { Text("Refresh") }))
                .navigationBarTitle("User List")
            }
        }
        
        func addUser(){
            observed.getUserList()
        }
    }



    class Observer : ObservableObject{
        @Published var users = [User]()

        init() {
            getUserList()
        }
        
        func getUserList(page: Int = 1, perPage: Int = 10) {
            AF.request("https://reqres.in/api/users?page=\(page)&per_page=\(perPage)")
                .responseDecodable(of: UserListResponse.self) {
                    (response) in
                    guard let userListResponse : UserListResponse = response.value! else {return}
                    self.users = userListResponse.data
            }
        }
    }


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

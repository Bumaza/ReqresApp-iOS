//
//  ImageLoader.swift
//  ReqresApp
//
//  Created by Jozef Budac on 24/08/2020.
//  Copyright © 2020 Jozef Budac. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader : ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(url: String){
        guard let url = URL(string: url) else {return }
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

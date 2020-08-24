//
//  ImageView.swift
//  ReqresApp
//
//  Created by Jozef Budac on 24/08/2020.
//  Copyright © 2020 Jozef Budac. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageView : View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image:UIImage = UIImage()
    
    init(withURL url: String){
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
            .onReceive(imageLoader.didChange) {data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

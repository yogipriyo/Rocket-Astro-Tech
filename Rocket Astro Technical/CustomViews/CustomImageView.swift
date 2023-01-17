//
//  CustomImageView.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 17/01/23.
//

import SwiftUI
import Combine

struct CustomImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:50, height:50)
            .cornerRadius(5)
            .onReceive(imageLoader.$image) { image in
                self.image = image
            }
            .onAppear {
                imageLoader.loadImage(for: urlString)
            }
    }
}

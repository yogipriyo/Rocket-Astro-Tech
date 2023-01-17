//
//  RocketItemView.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 16/01/23.
//

import SwiftUI

struct RocketItemView: View {
    private let viewModel: RocketItemViewModel
  
    init(viewModel: RocketItemViewModel) {
        self.viewModel = viewModel
    }
  
    var body: some View {
        NavigationLink(destination: RocketDetailsView()) {
            HStack {
                CustomImageView(urlString: viewModel.imageUrl) // This is where you extract urlString from Model ( transaction.imageUrl)
                
                VStack(alignment: .leading) {
                    Text("\(viewModel.name)")
                        .font(.body)
                        .padding(.bottom, 2)
                    Text("\(viewModel.description)")
                        .font(.footnote)
                        .lineLimit(2)
                }
                .padding(.leading, 8)
            }
        }
    }
}

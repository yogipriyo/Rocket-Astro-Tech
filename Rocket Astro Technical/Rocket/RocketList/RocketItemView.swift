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
        HStack {
            VStack(alignment: .leading) {
                Text("\(viewModel.name)")
                    .font(.body)
                Text("\(viewModel.description)")
                    .font(.footnote)
            }
            .padding(.leading, 8)

            Spacer()
            
            Image("RightChevron").resizable()
                .scaledToFit()
        }
    }
}

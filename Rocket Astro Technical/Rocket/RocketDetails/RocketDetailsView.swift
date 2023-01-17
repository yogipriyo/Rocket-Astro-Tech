//
//  RocketDetailsView.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 16/01/23.
//

import SwiftUI

struct RocketDetailsView: View {
    
    private let viewModel: RocketDetailsViewModel
  
    init(viewModel: RocketDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            CustomImageView(urlString: viewModel.imageUrl)
                
            Text("\(viewModel.name)")
                .font(.title.bold())
                
            Text("\(viewModel.description)")
                .font(.body)
                
            Text("Cost per launch: USD \(viewModel.costPerLaunch)")
                .font(.body)
                
            Text("Country: \(viewModel.country)")
                .font(.body)
                
            Text("First Flight: \(viewModel.firstFlight)")
                .font(.body)
            
            Spacer()
        }
        .padding(10)
        .navigationBarTitle("Rocket Details")
    }
}

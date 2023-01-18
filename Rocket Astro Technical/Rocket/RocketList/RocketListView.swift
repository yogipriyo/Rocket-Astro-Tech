//
//  RocketListView.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 16/01/23.
//

import SwiftUI

struct RocketListView: View {
    @ObservedObject var viewModel: RocketListViewModel

    init(viewModel: RocketListViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                searchField
                
                switch viewModel.state {
                case .loading:
                    ActivityIndicator()
                case .loaded:
                    if viewModel.dataSource.isEmpty {
                        emptySection
                    } else {
                        forecastSection
                    }
                default:
                    errorSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Rocket List")
        }
    }
}

private extension RocketListView {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("Search : e.g. Falcon", text: $viewModel.rocketName)
        }
    }

    var forecastSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: RocketItemView.init(viewModel:))
        }
    }
    
    var errorSection: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .center) {
                Spacer()
                Text("Sorry, we have an error, please retry..")
                    .foregroundColor(.gray)
                Spacer()
            }
            
            Button("Retry!") {
                viewModel.fetchRocket()
            }
        }
        .frame(height: 400)
    }

    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}


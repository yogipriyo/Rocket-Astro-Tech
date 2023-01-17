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

                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    forecastSection
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

    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}


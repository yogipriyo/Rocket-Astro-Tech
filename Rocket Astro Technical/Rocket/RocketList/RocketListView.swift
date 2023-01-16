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
                    cityHourlyWeatherSection
                    forecastSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Rockets")
        }
    }
}

private extension RocketListView {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("e.g. Falcon", text: $viewModel.rocketName)
        }
    }

  var forecastSection: some View {
      Section {
          ForEach(viewModel.dataSource, content: RocketItemView.init(viewModel:))
      }
  }

  var cityHourlyWeatherSection: some View {
      Section {
          NavigationLink(destination: RocketDetailsView()) {
              VStack(alignment: .leading) {
                  Text("viewModel.city")
                  Text("Weather today")
                      .font(.caption)
                      .foregroundColor(.gray)
              }
          }
      }
  }

  var emptySection: some View {
      Section {
          Text("No results")
              .foregroundColor(.gray)
      }
  }
}


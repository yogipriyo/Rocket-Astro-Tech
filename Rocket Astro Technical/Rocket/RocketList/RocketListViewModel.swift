//
//  RocketListViewModel.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 16/01/23.
//

import SwiftUI
import Combine

class RocketListViewModel: ObservableObject, Identifiable {
    @Published var rocketName: String = ""
    @Published var dataSource: [RocketItemViewModel] = []

    private let rocketFetcher: RocketFetchable
    private var disposables = Set<AnyCancellable>()

    init(rocketFetcher: RocketFetchable) {
        self.rocketFetcher = rocketFetcher
    }
    
    func fetchRocket(forRocket name: String) {
        rocketFetcher.getAllRockets()
        .map { response in
            response.map(RocketItemViewModel.init)
        }
        .receive(on: DispatchQueue.main)
        .sink(
          receiveCompletion: { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .failure:
              self.dataSource = []
            case .finished:
              break
            }
          },
          receiveValue: { [weak self] rockets in
            guard let self = self else { return }
            self.dataSource = rockets
        })
        .store(in: &disposables)
    }

}
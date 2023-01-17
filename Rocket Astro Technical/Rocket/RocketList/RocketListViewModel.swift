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

    private var originDataSource: [RocketItemViewModel] = []
    private let rocketFetcher: RocketFetchable
    private var disposables = Set<AnyCancellable>()

    init(
        rocketFetcher: RocketFetchable,
        scheduler: DispatchQueue = DispatchQueue(label: "RocketViewModel")
    ) {
        self.rocketFetcher = rocketFetcher
        
        fetchRocket()
        
        $rocketName
            .dropFirst(1)
            .debounce(for: .seconds(1), scheduler: scheduler)
            .sink(receiveValue: filterRocket(forRocket:))
            .store(in: &disposables)
    }
    
    func filterRocket(forRocket name: String) {
        if !name.isEmpty {
            let newRocketList = originDataSource.filter { $0.name.contains(name) }
            self.dataSource = newRocketList
        } else {
            self.dataSource = originDataSource
        }
    }
    
    func fetchRocket() {
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
                        self.originDataSource = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] rockets in
                    guard let self = self else { return }
                    self.dataSource = rockets
                    self.originDataSource = rockets
            })
            .store(in: &disposables)
    }

}

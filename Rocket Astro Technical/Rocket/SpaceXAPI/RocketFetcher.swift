//
//  RocketFetcher.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 16/01/23.
//

import Foundation
import Combine

protocol RocketFetchable {
    func getAllRockets() -> AnyPublisher<[RocketDetails], RocketError>
}

extension RocketFetcher: RocketFetchable {
    func getAllRockets() -> AnyPublisher<[RocketDetails], RocketError> {
        return componentFactory(with: makeGetAllRocketsComponents())
    }

    private func componentFactory<T>( with components: URLComponents) -> AnyPublisher<T, RocketError> where T: Decodable {
        guard let url = components.url else {
            let error = RocketError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            
        .mapError { error in
            .network(description: error.localizedDescription)
        }
        .flatMap(maxPublishers: .max(1)) { pair in
            decode(pair.data)
        }
        .eraseToAnyPublisher()
    }
}

class RocketFetcher {
    private let session: URLSession
  
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension RocketFetcher {
    struct SpaceXDataAPI {
        static let scheme = "https"
        static let host = "api.spacexdata.com"
        static let path = "/v4"
    }
  
    func makeGetAllRocketsComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = SpaceXDataAPI.scheme
        components.host = SpaceXDataAPI.host
        components.path = SpaceXDataAPI.path + "/rockets"
    
        return components
    }
}

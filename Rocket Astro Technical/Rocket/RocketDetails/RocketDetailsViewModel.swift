//
//  RocketDetailsViewModel.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 17/01/23.
//

struct RocketDetailsViewModel {
    
    private let item: RocketDetails
    
    var imageUrl: String {
        return item.flickrImages.first ?? "https://www.spacex.com/static/images/share.jpg"
    }
    
    var name: String {
        return item.name
    }
    
    var description: String {
        return item.description
    }
    
    var costPerLaunch: Int {
        return item.costPerLaunch
    }
    
    var country: String {
        return item.country
    }
    
    var firstFlight: String {
        return item.firstFlight
    }
    
    init(item: RocketDetails) {
        self.item = item
    }
}

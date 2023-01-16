//
//  RocketItemViewModel.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 16/01/23.
//

import Foundation
import SwiftUI

struct RocketItemViewModel: Identifiable {
    private let item: RocketDetails
  
    var id: String {
        return item.id
    }
  
    var name: String {
        return item.name
    }

    var imageUrl: String {
        return item.flickrImages.first ?? "https://www.spacex.com/static/images/share.jpg"
    }

    var description: String {
        return item.description
    }
  
    init(item: RocketDetails) {
        self.item = item
    }
}

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
  
//  var day: String {
//    return dayFormatter.string(from: item.date)
//  }
//
//  var month: String {
//    return monthFormatter.string(from: item.date)
//  }
//
//  var temperature: String {
//    return String(format: "%.1f", item.main.temp)
//  }
//
//  var title: String {
//    guard let title = item.weather.first?.main.rawValue else { return "" }
//    return title
//  }
//
//  var fullDescription: String {
//    guard let description = item.weather.first?.weatherDescription else { return "" }
//    return description
//  }
  
    init(item: RocketDetails) {
        self.item = item
    }
}

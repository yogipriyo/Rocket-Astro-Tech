//
//  RocketError.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 16/01/23.
//

import Foundation

enum RocketError: Error {
    case parsing(description: String)
    case network(description: String)
}

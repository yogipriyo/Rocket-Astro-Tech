//
//  Response.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 16/01/23.
//

import Foundation

struct RocketDetails: Codable {
    let id: String
    let description: String
    let wikipedia: String
    let company: String
    let country: String
    let firstFlight: String
    let successRatePct: Int
    let costPerLaunch: Int
    let boosters: Int
    let stages: Int
    let active: Bool
    let type: String
    let name: String
    let flickrImages: [String]
    let payloadWeights: [PayloadWeight]
    let landingLegs: LandingLeg
    let engines: Engine
    let height: Measurement
    let diameter: Measurement
    let mass: Mass
    let firstStage: FirstStage
    let secondStage: SecondStage

    enum CodingKeys: String, CodingKey {
        case id, description, wikipedia, company, country, boosters, stages, active, type, name, engines, height, diameter, mass
        case firstFlight = "first_flight"
        case successRatePct = "success_rate_pct"
        case costPerLaunch = "cost_per_launch"
        case flickrImages = "flickr_images"
        case payloadWeights = "payload_weights"
        case landingLegs = "landing_legs"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
    }
}

struct PayloadWeight: Codable {
    let id: String
    let name: String
    let kg: Int
    let lb: Int
}

struct LandingLeg: Codable {
    let number: Int
    let material: String?
}

struct FirstStage: Codable {
    let thrustSeaLevel: Thrust
    let thrustVacuum: Thrust
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double?
    let burnTimeSec: Int?
    
    enum CodingKeys: String, CodingKey {
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
    }
}

struct SecondStage: Codable {
    let thrust: Thrust
    let payloads: Payload
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double?
    let burnTimeSec: Int?
    
    enum CodingKeys: String, CodingKey {
        case thrust, payloads, reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
}

struct Payload: Codable {
    let compositeFairing: CompositeFairing
    let option1: String
    
    struct CompositeFairing: Codable {
        let height: Measurement
        let diameter: Measurement
    }
    
    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}

struct Mass: Codable {
    let kg: Int
    let lb: Int
}

struct Measurement: Codable {
    let meters: Double?
    let feet: Double?
}

struct Thrust: Codable {
    let kN: Int
    let lbf: Int
}

struct Engine: Codable {
    let isp: Isp
    let thrustSeaLevel: Thrust
    let thrustVacuum: Thrust
    let number: Int
    let type: String
    let version: String
    let layout: String?
    let engineLossMax: Int?
    let propellant1: String
    let propellant2: String
    let thrustToWeight: Double
    
    struct Isp: Codable {
        let seaLevel: Int
        let vacuum: Int
        
        enum CodingKeys: String, CodingKey {
            case seaLevel = "sea_level"
            case vacuum
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case isp, number, type, version, layout
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

//
//  RocketListView.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 16/01/23.
//

import SwiftUI

struct RocketListView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    "Best rocket app :] ⛅️",
                    destination: RocketDetailsView()
                )
            }
        }
    }
}

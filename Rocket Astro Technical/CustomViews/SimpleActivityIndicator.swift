//
//  SimpleActivityIndicator.swift
//  Rocket Astro Technical
//
//  Created by Yogi Priyo Prayogo on 18/01/23.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}

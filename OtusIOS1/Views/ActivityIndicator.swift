//
//  ActivityIndicator.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    typealias UIViewType = UIActivityIndicatorView

    @Binding var startAnimating: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        startAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

//
//  ActivityIndicator.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {

    public typealias UIViewType = UIActivityIndicatorView

    @Binding var startAnimating: Bool

    public init(startAnimating: Binding<Bool>) {
        self._startAnimating = startAnimating
    }

    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        startAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

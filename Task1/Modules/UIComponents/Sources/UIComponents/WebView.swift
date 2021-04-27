//
//  WebView.swift
//  
//
//  Created by Alexey Bolvonovich on 7.04.21.
//

import Foundation
import SwiftUI
import WebKit

public struct Webview: UIViewRepresentable {

    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func makeUIView(context: UIViewRepresentableContext<Webview>) -> WKWebView {
        let webview = WKWebView()

        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)

        return webview
    }

    public func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<Webview>) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
    }
}

struct ContentView: View {

    var body: some View {
        Webview(url: URL(string: "https://google.com")!)
    }
}

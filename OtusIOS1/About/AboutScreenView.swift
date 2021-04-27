//
//  Screens.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import SwiftUI

struct AboutScreenView: View {

    @State private var showCredits: Bool = false

    var body: some View {
        VStack {
            Image(systemName: "star").font(Font.system(size: 200))
            Spacer().frame(height: 80)
            Button(action: {
                showCredits.toggle()
            }) {
                Text("Version 1.0.0")
            }
        }.sheet(isPresented: $showCredits, content: {
            Text("Made by me").font(.largeTitle)
        })
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreenView()
    }
}

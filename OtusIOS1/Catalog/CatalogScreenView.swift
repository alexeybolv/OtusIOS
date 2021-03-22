//
//  CatalogScreenView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 23.03.21.
//

import SwiftUI
import UIComponents

struct CatalogScreenView: View {
    var body: some View {
        CustomButton(action: {
            print("CustomButton")
        }, content: {
            Text("Hello, World!")
        })
    }
}

struct CatalogScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreenView()
    }
}

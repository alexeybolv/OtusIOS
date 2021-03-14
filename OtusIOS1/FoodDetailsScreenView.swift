//
//  FoodDetailsScreenView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import SwiftUI

struct FoodDetailsScreenView: View {

    let emoji: String

    var body: some View {
        Text(emoji).font(Font.system(size: 200))
    }
}

struct FoodDetailsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailsScreenView(emoji: "🍏")
    }
}

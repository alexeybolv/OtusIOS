//
//  DashboardScreenView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import SwiftUI
import UIComponents

struct DashboardScreenView: View {

    @EnvironmentObject var router: Router
    @State var shouldShowActivityIndicator: Bool = false

    var body: some View {
        VStack {
            ActivityIndicator(startAnimating: $shouldShowActivityIndicator)
            Spacer()
                .frame(height: 30.0)
            Text("Start Page")
            Button(action: {
                router.selection = 1
                router.isSuperFoodShowed = true
            }) {
                Text("Show super food")
            }
            .padding()
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(8)
            Spacer()
                .frame(height: 30.0)
            Button(action: {
                shouldShowActivityIndicator.toggle()
            }) {
                shouldShowActivityIndicator ? Text("Hide activity") : Text("Show activity")
            }
            .padding()
            .background(Color.yellow)
            .cornerRadius(8)
        }
    }
}

struct DashboardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreenView()
    }
}

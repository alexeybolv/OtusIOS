//
//  DashboardScreenView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import SwiftUI

struct DashboardScreenView: View {

    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
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
        }
    }
}

struct DashboardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreenView()
    }
}

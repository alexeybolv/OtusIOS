//
//  ContentView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            DashboardScreenView()
                .tabItem {
                    Text("Main")
                    Image(systemName: "star")
                }
                .tag(0)
            FoodScreenView()
                .tabItem {
                    Text("Food")
                    Image(systemName: "pills")
                }
                .tag(1)
            AboutScreenView()
                .tabItem {
                    Text("About")
                    Image(systemName: "star")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


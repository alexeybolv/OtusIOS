//
//  ContentView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var router: Router

    var body: some View {
        TabView(selection: $router.selection) {
            DashboardScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Main")
                    }
                }
                .tag(0)
            FoodScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "pills")
                        Text("Food")
                    }
                }
                .tag(1)
            AboutScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "graduationcap")
                        Text("About")
                    }
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


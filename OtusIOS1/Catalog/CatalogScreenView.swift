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
        NavControllerView(transition: .custom(.moveAndFade)) {
            CatalogScreenContents()
        }
    }
}

struct CatalogScreenContents: View {

    var columns: [GridItem] = Array(repeating: .init(), count: 3)

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    HStack {
                        NavPushButton(destination: SecondScreenView()) {
                            Text("Second screen")
                                .font(.title)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(6)
                        }

                        CustomButton(action: {
                            print("CustomButton")
                        }, content: {
                            Text("Hello!")
                        })
                    }
                    LazyVGrid(columns: columns) {
                        ForEach((0...1000), id: \.self) {
                            Text("\($0)")
                                .padding()
                                .frame(width: geometry.size.width/3)
                                .background(Color.pink)
                        }
                    }
                }
            }
        }
    }
}

struct SecondScreenView: View {

    var body: some View {
        NavPopButton {
            Image(systemName: "arrow.left.circle.fill")
                .font(.largeTitle)
        }
    }
}

struct CatalogScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreenView()
    }
}

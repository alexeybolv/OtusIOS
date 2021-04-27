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

    @State var showAnimationModal: Bool = false
    @State var showGeometryFXModal: Bool = false
    @State var showDiagramModal: Bool = false

    var headerImage: Image {
        Image("City")
    }

    var stretchyHeader: some View {
        ScrollView {
            GeometryReader { g in
                if g.frame(in: .global).minY <= 0 {
                    headerImage
                        .imageFill()
                        .frame(width: g.size.width, height: g.size.height)
                        .offset(y: g.frame(in: .global).minY/9)
                } else {
                    headerImage
                        .imageFill()
                        .frame(width: g.size.width, height: g.size.height + g.frame(in: .global).minY)
                        .offset(y: -g.frame(in: .global).minY)
                }
            }
            .modifier(StretchyHeaderModifier())
        }
    }

    var body: some View {
        VStack {
            stretchyHeader
            Spacer()
                .frame(height: 30.0)

            ActivityIndicator(startAnimating: $shouldShowActivityIndicator)
            Spacer()
                .frame(height: 30.0)
            Text("Start Page")
            VStack {
                Text("Show Diagram")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        showDiagramModal.toggle()
                    }
                    .sheet(isPresented: $showDiagramModal, content: {
                        DiagramModalView()
                    })
                Text("Show GFX")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        showGeometryFXModal.toggle()
                    }
                    .sheet(isPresented: $showGeometryFXModal, content: {
                        GeometryFXModalView()
                    })
                Text("Show animation")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        showAnimationModal.toggle()
                    }
                    .sheet(isPresented: $showAnimationModal, content: {
                        AnimationModalView()
                    })
                Button {
                    router.selection = 1
                    router.isSuperFoodShowed = true
                } label: {
                    Text("Show super food")
                }
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
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
            Spacer(minLength: 30)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

extension Image {
    func imageFill() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct StretchyHeaderModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .frame(height: 400)
    }
}

struct DashboardScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreenView()
    }
}

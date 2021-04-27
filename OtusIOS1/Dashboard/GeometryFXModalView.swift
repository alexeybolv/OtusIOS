//
//  GeometryFXModalView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 7.04.21.
//

import SwiftUI

struct GeometryFXModalView: View {

    @State var isGeometryAnimated: Bool = false

    func configureEffect(diameter: CGFloat) -> some GeometryEffect {
        OrbitEffect(percent: isGeometryAnimated ? 0.0 : 0.5, radius: diameter/2.0)
    }

    var card: some View {
        VStack {
            Text("Курсы валют на 7 апреля.\n Доллар побил исторический рекорд")
                .frame(minHeight: 100)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }

    var body: some View {
        card
            .modifier(configureEffect(diameter: 100))
            .onTapGesture {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: true)) {
                    isGeometryAnimated.toggle()
                }
            }
    }
}

struct OrbitEffect: GeometryEffect {

    let initialAngle: CGFloat = 0

    var percent: CGFloat = 0
    let radius: CGFloat

    var animatableData: CGFloat {
        get { return percent }
        set { percent = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let angle = 2 * .pi * percent + initialAngle
        let pt = CGPoint(
            x: cos(angle) * radius,
            y: sin(angle) * radius)
        return ProjectionTransform(CGAffineTransform(translationX: pt.x, y: pt.y))
    }
}

struct GeometryFXModalView_Previews: PreviewProvider {

    static var previews: some View {
        GeometryFXModalView()
    }
}

//
//  DiagramModalView.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 7.04.21.
//

import SwiftUI

struct DiagramModalView: View {

    @State var diagramSwitch: Bool = false
    @State var diagramDatas = [(CFTimeInterval, CGFloat)]() // Path

    var animation: Animation {
        //Animation.easeIn(duration: 2.0).delay(0.3)
        Animation.spring(response: 0.7, dampingFraction: 0.2, blendDuration: 0.2).speed(2.0).delay(0.3)
    }

    var body: some View {
        VStack(alignment: .leading ) {
            // HStack { Spacer() }
            Circle()
                .fill(Color.purple)
                .frame(width: 44, height: 44)
                .offset(x: diagramSwitch ? 300 : 0)
                .modifier(DiagramEffect(callback: { value in
                    DispatchQueue.main.async {
                        self.diagramDatas.append((CACurrentMediaTime(), value))
                    }
                }, animatableData: diagramSwitch ? 1.0 : 0.0))
                .animation(animation)

            PathDiagram(data: diagramDatas)
                .stroke(Color.green, lineWidth: 2)
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .border(Color.gray, width: 1)

            Button(action: {diagramSwitch.toggle()}) {
                Text("Start Left/Right")
            }
        }
        //.frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }

}

struct DiagramEffect: GeometryEffect {

    var callback: (CGFloat) -> ()
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        callback(animatableData)
        return ProjectionTransform()
    }

}

struct PathDiagram: Shape {

    var data = [(CGFloat, CGFloat)]() // tuples

    init(data: [(CFTimeInterval, CGFloat)]) {
        guard let last = data.last else { return }
        let maxX = last.0
        let slice = data.drop { $0.0 < maxX - 3 }
        guard let minX = slice.first?.0 else { return }
        self.data = slice.map {
            (CGFloat(($0.0 - maxX) / (minX - maxX)), $0.1)
        }
    }

    func path(in rect: CGRect) -> Path {
        guard !data.isEmpty else { return Path() }
        let points = data.map { CGPoint(x: $0.0 * rect.width, y: $0.1 * rect.height)}
        return Path { p in
            p.move(to: points[0])
            p.addLines(points)
        }
    }
}

struct DiagramModalView_Previews: PreviewProvider {
    static var previews: some View {
        DiagramModalView()
    }
}

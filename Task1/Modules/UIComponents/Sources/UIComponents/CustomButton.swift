//
//  CustomButton.swift
//  
//
//  Created by Alexey Bolvonovich on 23.03.21.
//

import SwiftUI

public struct CustomButton<Content>: View where Content: View {

    private let action: () -> Void
    private let content: () -> Content

    @State private var tapped: Bool = false

    public init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }

    public var body: some View {
        content()
            .font(.title)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(6)
            .onTapGesture {
                action()
            }
            .onLongPressGesture(minimumDuration: 100, pressing: { (isPressing) in
                tapped = isPressing
            }, perform: {})
            .opacity(tapped ? 0.4 : 1)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(action: {
            print("Custom Button")
        }, content: {
            Text("")
        })
    }
}

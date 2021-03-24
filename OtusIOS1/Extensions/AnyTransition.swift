//
//  AnyTransition.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 24.03.21.
//

import SwiftUI

extension AnyTransition {

    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

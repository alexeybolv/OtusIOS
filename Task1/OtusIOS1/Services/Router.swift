//
//  Router.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 14.03.21.
//

import Foundation
import Combine
import SwiftUI

final class Router: ObservableObject {

    @Published var selection: Int = 0
    @Published var isSuperFoodShowed: Bool = false
}

//
//  Optional.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 25.03.21.
//

import Foundation

extension Optional where Wrapped == String {

    var asStringOrEmpty: String {
        self ?? ""
    }
}

//
//  String.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 25.03.21.
//

import Foundation

extension String {

    func trim() -> Self {
        self.filter { !"\n\t\r".contains($0) }
    }
}

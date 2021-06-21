//
//  Analytics.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 21.06.21.
//

import Foundation

import Foundation

enum AnalyticsEvent: String {
    case apiCall = "Api_Call"
}


extension Analytics {

    static var injected: Analytics {
        let a: Analytics = ServiceLocator.assembly.inject()
        return a
    }

}

final class Analytics {

    func sendToSDK(_ name: AnalyticsEvent, _ properties: [AnyHashable: Any]? = nil) {
        print("send event \(name) \(String(describing: properties))")
    }

    func event(_ name: AnalyticsEvent, _ properties: [AnyHashable: Any]? = nil) {
        sendToSDK(name, properties)
    }
}


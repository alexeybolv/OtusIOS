//
//  ServiceLocator.swift
//  OtusIOS1
//
//  Created by Alexey Bolvonovich on 20.06.21.
//

import Foundation

final class ServiceLocator {

    private var registry = [ObjectIdentifier: Any]()
    static var assembly: ServiceLocator = ServiceLocator() // shared

    private init() {
        registerFirstServices()
    }

    // MARK: - Declaration

    func registerFirstServices() {
        registerSingleton(singletonInstance: Analytics())
    }

    // MARK: - Registration

    func register<Service>(factory: @escaping () -> Service) {
        let serviceId = ObjectIdentifier(Service.self)
        registry[serviceId] = factory
    }

    func registerSingleton<Service>(singletonInstance: Service) {
        let serviceId = ObjectIdentifier(Service.self)
        registry[serviceId] = singletonInstance
    }

    // MARK: - Injection

    func inject<Service>() -> Service {
        let serviceId = ObjectIdentifier(Service.self)
        if let factory = registry[serviceId] as? () -> Service {
            return factory()
        } else if let singletonInstance = registry[serviceId] as? Service {
            return singletonInstance
        } else {
            fatalError("No registered entry for \(Service.self)")
        }
    }
}

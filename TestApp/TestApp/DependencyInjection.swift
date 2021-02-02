//
//  DependencyInjection.swift
//  TestApp
//
//  Created by Nguyen Duc Tho on 2/2/21.
//  Copyright © 2021 thond. All rights reserved.
//

import Foundation
protocol DIContainerProtocol {
    func register<Component>(type: Component.Type, component: Any)
    func resolve<Component>(type: Component.Type) -> Component?
}

final class DIContainer: DIContainerProtocol {
    // 1
    static let shared = DIContainer()
    
    // 2
    private init() {}
    
    // 3
    var components: [String: Any] = [:]
    
    func register<Component>(type: Component.Type, component: Any) {
        // 4
        components["\(type)"] = component
    }
    
    func resolve<Component>(type: Component.Type) -> Component? {
        // 5
        return components["\(type)"] as? Component
    }
}

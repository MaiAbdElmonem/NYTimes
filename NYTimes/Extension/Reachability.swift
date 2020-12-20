//
//  Reachability.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Network
import Foundation

class Reachability {

    static let shared = Reachability()
    lazy private var monitor = NWPathMonitor()

    private init() {}

    var isConnected: Bool {
            return monitor.currentPath.status == .satisfied
    }

    func startNetworkReachabilityObserver() {
            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    NotificationCenter.default.post(name: Notifications.connected.name, object: nil)
                } else if path.status == .unsatisfied {
                    NotificationCenter.default.post(name: Notifications.notConnected.name, object: nil)
                }
            }
            let queue = DispatchQueue.global(qos: .background)
            monitor.start(queue: queue)
    }
}

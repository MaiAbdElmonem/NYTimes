//
//  NotificationName.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Foundation

protocol NotificationName {
    var name: Notification.Name { get }
}

extension RawRepresentable where RawValue == String, Self: NotificationName {
    var name: Notification.Name {
        return Notification.Name(rawValue)
    }
}

enum Notifications: String, NotificationName {
    case connected
    case notConnected
    case foodCategoryImageTapped
}

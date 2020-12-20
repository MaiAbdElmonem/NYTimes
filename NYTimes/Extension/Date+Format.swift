//
//  Date+Format.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import Foundation

extension Date {
    var timeAgo: String {
        get {
            let relativeDateFormatter = RelativeDateTimeFormatter()
            //change these to get different formats
            relativeDateFormatter.dateTimeStyle = .named
            relativeDateFormatter.unitsStyle = .full
            let relativeDate = relativeDateFormatter.localizedString(for: self, relativeTo: Date())
            return relativeDate.capitalized
        }
    }
}

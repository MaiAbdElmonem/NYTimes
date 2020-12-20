//
//  Strings.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import Foundation

enum Strings: String {

    // MARK: Errors
    case commonGeneralError = "Common_GeneralError"
    case commonInternetError = "Common_InternetError"

    // MARK: News
    case newsTitle = "News_Title"
    case newsEmptyTitle = "News_EmptyTitle"
    case newsEmptySubtitle = "News_EmptySubtitle"

    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

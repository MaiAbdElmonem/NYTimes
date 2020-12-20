//
//  NYErrors.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Foundation

public enum NYErrors: Error {
    case genericError
    case noInternetConnection
    case timeout
    case fileNotFound
    case noResults
    case apiError(code: Int, message: String, reason: String)
    case retryError(message: String, retryAction: (() -> Void))
    case unauthorized
    var localizedDescription: String {
        switch self {
        case .noResults:
            return "No result found"
        case .noInternetConnection:
            return "No Internet Connection"
        default:
            return "something wrong Happen, please try other time"
        }
    }
}

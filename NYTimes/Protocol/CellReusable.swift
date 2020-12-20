//
//  CellReusable.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Foundation

protocol CellReusable {
    static var identifier: String { get }
}

extension CellReusable {
    static var identifier: String {
        return "\(self)"
    }
}

//
//  UITableView+ReusableCell.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: CellReusable>(for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
    }
}

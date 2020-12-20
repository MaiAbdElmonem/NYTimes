//
//  UITableView+EmptyState.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import UIKit

extension UITableView {

    func setEmptyView(emptyPlaceHolderType: EmptyPlaceHolderType) {
        let frame = CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height)
        let emptyPlaceHolderView = EmptyPlaceHolderView(frame: frame)
        emptyPlaceHolderView.translatesAutoresizingMaskIntoConstraints = false
        emptyPlaceHolderView.emptyPlaceHolderType = emptyPlaceHolderType
        backgroundView = emptyPlaceHolderView
        NSLayoutConstraint.activate([
            emptyPlaceHolderView.centerYAnchor.constraint(equalTo: centerYAnchor),
            emptyPlaceHolderView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func restore() {
        backgroundView = nil
    }
}

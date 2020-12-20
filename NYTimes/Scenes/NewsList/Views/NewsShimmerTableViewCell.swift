//
//  NewsShimmerTableViewCell.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Shimmer

class NewsShimmerTableViewCell: UITableViewCell, CellReusable {
    func configureCell() {
        let shimmeringView = FBShimmeringView(frame: bounds)
        addSubview(shimmeringView)
        NSLayoutConstraint.activate([
            shimmeringView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shimmeringView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shimmeringView.topAnchor.constraint(equalTo: topAnchor),
            shimmeringView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        shimmeringView.contentView = contentView
        shimmeringView.isShimmering = true
    }
}

//
//  UIView+Loading.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import Foundation
import UIKit

public enum Tags {
   public enum Loading: Int {
        case defaultLoadingIndicator = 999999
    }
}

public extension UIView {
    private var loadingIndicatorView: UIActivityIndicatorView {
        let style: UIActivityIndicatorView.Style = {
                return .medium
        }()

        let indicatorView = UIActivityIndicatorView(style: style)
        indicatorView.backgroundColor = UIColor.secondarySystemBackground
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }

    private var titleLabel: UILabel {
        let label  =  UILabel()
        label.alpha = 0
        label.textColor = UIColor.label
        label.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func showLoadingIndicator(tag: Tags.Loading = Tags.Loading.defaultLoadingIndicator, _ backgroundAlpha: CGFloat = 0.3) {
        guard viewWithTag(tag.rawValue) == nil else {
            if let loadingIndicator = viewWithTag(tag.rawValue) as? UIActivityIndicatorView {
                loadingIndicator.startAnimating()
            }
            return
        }

        let height: CGFloat = 45

        let loadingView = loadingIndicatorView
        loadingView.tag = tag.rawValue
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(backgroundAlpha)
        loadingView.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        loadingView.layer.cornerRadius = height * 0.2
        addSubview(loadingView)

        NSLayoutConstraint.activate([
            loadingView.widthAnchor.constraint(equalToConstant: height),
            loadingView.heightAnchor.constraint(equalTo: loadingView.widthAnchor),
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        layoutIfNeeded()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            loadingView.startAnimating()
        }

    }

    func dismissLoadingIndicator(tag: Tags.Loading =  Tags.Loading.defaultLoadingIndicator) {

        DispatchQueue.main.async(execute: {
            while self.viewWithTag(tag.rawValue) != nil {
                self.viewWithTag(tag.rawValue)?.removeFromSuperview()
            }
        })
    }

}

public extension UIViewController {

    func showLoadingIndicator() {
        view.showLoadingIndicator()
    }

    func dismissLoadingIndicator() {
        view.dismissLoadingIndicator()
    }
}

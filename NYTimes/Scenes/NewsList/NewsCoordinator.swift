//
//  NewsCoordinator.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import UIKit

class NewsCoordinator {
    private var window: UIWindow

    init(_ window: UIWindow) {
        self.window = window
    }

    func start() {
        let viewModel = DependencyInjection.shared.resolve(NewsViewModel.self)
        viewModel.coordinator = self
        let viewController = NewsViewController(viewModel)
        window.rootViewController = UINavigationController(rootViewController: viewController)
    }
}

//
//  ApplicationCoordinator.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import RxSwift
import UIKit

class ApplicationCoordinator {
    private let window: UIWindow?
    private let disposeBag = DisposeBag()

    required init(_ window: UIWindow?) {
        self.window = window
    }

    func start() {
        guard let window = window else {
            return
        }
        NewsCoordinator(window).start()
    }
}

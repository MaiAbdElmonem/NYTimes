//
//  Container+Data.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import Foundation
import Swinject

extension Container {
    public func registerDataDependencies() {
        registerRepositories()
    }

    // MARK: Use Cases DI
    private func registerRepositories() {
        self.register(NewsRepositoryProtocol.self) { _ in
            let remoteDataSource = NewsRemoteDataSource()
            return NewsRepository(remoteDataSource)
        }
    }
}

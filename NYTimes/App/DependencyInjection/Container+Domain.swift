//
//  Container+Domain.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import Foundation
import Swinject

extension Container {
    public func registerDomainDependencies() {
        registerUseCases()
    }

    // MARK: Use Cases DI
    private func registerUseCases() {
        self.register(GetNewsUseCase.self) { resolver in
            let repository = resolver.resolve(NewsRepositoryProtocol.self)!
            let useCase = GetNewsUseCase(repository)
            return useCase
        }
    }
}

//
//  Container+App.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import Swinject

extension Container {
    func registerAppDependencies() {
        registerViewModelDependencies()
    }

    private func registerViewModelDependencies() {
        self.register(NewsViewModel.self) { resolver in
            let getNewsUseCase = resolver.resolve(GetNewsUseCase.self)!
            let viewModel = NewsViewModel(getNewsUseCase)
            return viewModel
        }
    }
}

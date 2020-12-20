//
//  GetNewsUseCase.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Foundation
import RxSwift

public class GetNewsUseCase: SingleUseCaseProtocol {

    private var repository: NewsRepositoryProtocol

    init(_ repository: NewsRepositoryProtocol) {
        self.repository = repository
    }

    func invoke() -> Single<[News]> {
        return repository.getNews()
    }
}

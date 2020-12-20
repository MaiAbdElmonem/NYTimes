//
//  NewsRemoteDataSource.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import Foundation
import RxSwift

class NewsRemoteDataSource: BaseRemoteDataSource, NewsRemoteDataSourceProtocol {
    func getNews(_ day: Int) -> Single<[News]> {
        return request(day)
    }

    private func request(_ day: Int) -> Single<([News])> {
        return Single.create(subscribe: { [unowned self] single -> Disposable in
            provider.rx.request(.news("\(day)")).map(NewsResult<News>.self)
                .asObservable()
                .subscribe(onNext: { (response) in
                    single(.success(response.results ?? []))
                }, onError: { (error) in
                    single(.error(self.parseError(error)))
                })
        })
    }
}

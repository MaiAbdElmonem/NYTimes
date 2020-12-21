//
//  NewsRemoteDataSourceMockup.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import RxSwift

class NewsRemoteDataSourceMockup: NewsRemoteDataSourceProtocol {
    private let jsonLocalDataSource: JsonLocalDataSource

    public init() {
        jsonLocalDataSource = JsonLocalDataSource()
    }

    func getNews(_ day: Int) -> Single<[News]> {
        return request(day).map({ (newsResponse) -> [News] in
            return newsResponse.results
        })
    }

    private func request(_ day: Int) -> Single<NewsResult<News>> {
        return jsonLocalDataSource.read("NewsMockup")
    }
}

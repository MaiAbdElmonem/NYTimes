//
//  File.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/20/20.
//

import RxSwift

public class NewsRepositoryMockup: NewsRepositoryProtocol {
    func getNews() -> Single<[News]> {
        return getNewsMockup().map({ (newsResponse) -> [News] in
            return newsResponse.results
        })
    }

    private func getNewsMockup() -> Single<NewsResult<News>> {
        let jsonLocalDataSource: JsonLocalDataSource = JsonLocalDataSource()
        return jsonLocalDataSource.read("NewsMockup")
    }
}

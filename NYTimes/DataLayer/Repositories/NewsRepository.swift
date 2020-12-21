//
//  NewsRepository.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Foundation
import RxSwift

 class NewsRepository: NewsRepositoryProtocol {
    private let newsRemoteDataSource: NewsRemoteDataSourceProtocol

    init(_ newsRemoteDataSource: NewsRemoteDataSourceProtocol) {
        self.newsRemoteDataSource = newsRemoteDataSource
    }

    func getNews() -> Single<[News]> {
       return newsRemoteDataSource.getNews(7)
    }
}

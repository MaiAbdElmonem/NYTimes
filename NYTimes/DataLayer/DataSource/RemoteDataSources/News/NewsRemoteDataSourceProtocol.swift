//
//  NewsRemoteDataSourceProtocol.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import RxSwift

protocol NewsRemoteDataSourceProtocol {
    func getNews(_ day: Int) -> Single<[News]>
}

//
//  NewsRepositoryProtocol.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Foundation
import RxSwift

protocol NewsRepositoryProtocol {
    func getNews() -> Single<[News]>
}

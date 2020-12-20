//
//  SingleUseCaseProtocol.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Foundation
import RxSwift

protocol SingleUseCaseProtocol {
    associatedtype DomainModel
    func invoke() -> Single<DomainModel>
}

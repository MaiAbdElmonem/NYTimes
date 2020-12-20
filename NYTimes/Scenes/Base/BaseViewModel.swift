////
//  SafeBoda
//
//	BaseViewModel.swift written using Swift 4.0
//
//  Created on: 12/12/2018
//
//  Copyright © 2018 SafeBoda. All rights reserved.
//

import RxSwift
import RxCocoa

class BaseViewModel: RxBaseProtocol {
    let disposeBag = DisposeBag()
    let errorRelay = PublishRelay<Error>()
    let loadingRelay = PublishRelay<Bool>()
    let showFullScreenLoading = PublishRelay<Bool>()

    func handleError(_ error: Error, _ retryAction: @escaping (() -> Void)) {
        switch error {
        case NYErrors.noInternetConnection:
            errorRelay.accept(NYErrors.noInternetConnection)
        default:
            errorRelay.accept(parseApiErrorToRetry(error, retryAction))
        }
    }

    private func parseApiErrorToRetry(_ error: Error, _ retryAction: @escaping (() -> Void)) -> Error {
        switch error {
        case NYErrors.apiError(_, let message, _):
            return NYErrors.retryError(message: message, retryAction: retryAction)
        case NYErrors.noInternetConnection:
            return NYErrors.retryError(message: Strings.commonInternetError.localized(), retryAction: retryAction)
        case NYErrors.timeout:
            return NYErrors.retryError(message: Strings.commonGeneralError.localized(), retryAction: retryAction)
        default:
            return error
        }
    }
}

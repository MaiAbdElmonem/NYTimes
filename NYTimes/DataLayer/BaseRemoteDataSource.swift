//
//  BaseRemoteDataSource.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Foundation
import RxSwift
import Moya

class BaseRemoteDataSource {
    let provider:MoyaProvider<NYTimes>
    init() {
        func JSONResponseDataFormatter(_ data: Data) -> String {
            do {
                let dataAsJSON = try JSONSerialization.jsonObject(with: data)
                let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
                return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
            } catch {
                return String(data: data, encoding: .utf8) ?? ""
            }
        }

        provider = MoyaProvider<NYTimes>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                                                                     logOptions: .verbose))])

    }

    // MARK: - Provider setup
    func parseError(_ error: Error) -> Error {
        switch error {
        case NYErrors.apiError(let code, _, _):
            if code == 401 || code == 406 {
                return NYErrors.unauthorized
            }
        default:
            break
        }
        return error
    }
}

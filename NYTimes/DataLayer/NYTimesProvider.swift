//
//  NYTimesProvider.swift
//  NYTimes
//
//  Created by BinaryBoy on 12/19/20.
//

import Foundation
import Moya

private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum NYTimes {
    case news(String)
}
//https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=oFxtvkjKBNexD6I5mwCDmzsg55OQcKKh

extension NYTimes: TargetType {
    public var baseURL: URL { return URL(string: "https://api.nytimes.com/svc/mostpopular/v2/")! }
    private var apiKey: String { return "oFxtvkjKBNexD6I5mwCDmzsg55OQcKKh" }

    public var path: String {
        switch self {
        case .news(let days):
            return "viewed/\(days).json"

        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var task: Task {
        switch self {
        case .news:
            return .requestParameters(parameters:["api-key":apiKey] , encoding: URLEncoding.default)
        }
    }

    public var validationType: ValidationType {
        switch self {
        case .news:
            return .successCodes
        }
    }

    public var headers: [String: String]? {
        return nil
    }
    
    public var sampleData: Data {
        switch self {
        case .news:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        }
    }
}

public func url(_ route: TargetType) -> String {
    return route.baseURL.appendingPathComponent(route.path).absoluteString
}

// MARK: - Response Handlers

extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}

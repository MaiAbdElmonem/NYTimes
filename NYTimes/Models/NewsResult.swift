//
//	NewsResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct NewsResult<T:Codable>: Codable {

	let copyright: String
	let numResults: Int
	let results: [T]
	let status: String

	enum CodingKeys: String, CodingKey {
		case copyright = "copyright"
		case numResults = "num_results"
		case results = "results"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		copyright = try values.decode(String.self, forKey: .copyright)
		numResults = try values.decode(Int.self, forKey: .numResults)
		results = try values.decode([T].self, forKey: .results)
		status = try values.decode(String.self, forKey: .status)
	}
}

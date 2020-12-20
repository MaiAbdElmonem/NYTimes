//
//	NewsResult.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct NewsResult<T:Codable>: Codable {

	let copyright: String?
	let numResults: Int?
	let results: [T]?
	let status: String?

	enum CodingKeys: String, CodingKey {
		case copyright = "copyright"
		case numResults = "num_results"
		case results = "results"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		numResults = try values.decodeIfPresent(Int.self, forKey: .numResults)
		results = try values.decodeIfPresent([T].self, forKey: .results)
		status = try values.decodeIfPresent(String.self, forKey: .status)
	}
}

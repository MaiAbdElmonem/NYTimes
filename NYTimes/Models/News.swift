//
//	News.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct News: Codable {
    let id: Int
    let title: String
    let updated: String
    let publishedDate: String
    let media: [Media]
    let abstractField: String


	enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case updated = "updated"
        case publishedDate = "published_date"
        case media = "media"
        case abstractField = "abstract"

	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decode(Int.self, forKey: .id)
		media = try values.decode([Media].self, forKey: .media)
		publishedDate = try values.decode(String.self, forKey: .publishedDate)
		title = try values.decode(String.self, forKey: .title)
		updated = try values.decode(String.self, forKey: .updated)
        abstractField = try values.decode(String.self, forKey: .abstractField)
	}
}

//
//	Media.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Media: Codable {

	let mediaMetadata: [MediaMetadata]

	enum CodingKeys: String, CodingKey {
		case mediaMetadata = "media-metadata"
	}
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		mediaMetadata = try values.decode([MediaMetadata].self, forKey: .mediaMetadata)
	}

}

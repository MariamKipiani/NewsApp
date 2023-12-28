//
//  NewsModel.swift
//  NewsPage
//
//  Created by user on 12/28/23.
//

import Foundation

struct NewsModel: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let author: String?
    let title: String
    let publishedAt: Date

    enum CodingKeys: String, CodingKey {
        case author, title, publishedAt
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        author = try container.decodeIfPresent(String.self, forKey: .author)
        title = try container.decode(String.self, forKey: .title)

        
        let dateString = try container.decode(String.self, forKey: .publishedAt)
        if let date = DateFormatter.iso8601.date(from: dateString) {
            publishedAt = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .publishedAt, in: container, debugDescription: "Date string is not in the expected format.")
        }
    }
}

extension DateFormatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
}


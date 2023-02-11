//
//  Comment.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import Foundation

struct Comment: Decodable, Identifiable {
    let id: String
    let body: String?
    let author: String?
    let score: Int?
    let created: Double?

    var createdDate: Date? {
        guard let created = created else { return nil }
        return Date(timeIntervalSince1970: created)
    }

    var scoreText: String? {
        guard let score = score else { return nil }
        return "\(score) points"
    }

    init(id: String, body: String?, author: String?, score: Int?, created: Double?) {
        self.id = id
        self.body = body
        self.author = author
        self.score = score
        self.created = created
    }

    private enum CodingKeys: String, CodingKey {
        case id, body, author, score, created
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        body = try? container.decode(String.self, forKey: .body)
        author = try? container.decode(String.self, forKey: .author)
        score = try? container.decode(Int.self, forKey: .score)
        created = try? container.decode(Double.self, forKey: .created)
    }
}

struct CommentData: Decodable {
    let data: CommentListing
}

struct CommentListing: Decodable {
    let children: [CommentChild]
}

struct CommentChild: Decodable {
    let data: Comment
}

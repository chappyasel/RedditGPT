//
//  Post.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import Foundation

struct Post: Decodable, Identifiable {
    let id: String
    let title: String
    let thumbnail: String
    let subreddit: String
    let score: Int
    let author: String
    let created: Double
    let num_comments: Int
    let permalink: String
}

struct RedditData: Decodable {
    let data: ListingData
}

struct ListingData: Decodable {
    let children: [ChildData]
    let after: String
}

struct ChildData: Decodable {
    let data: Post
}

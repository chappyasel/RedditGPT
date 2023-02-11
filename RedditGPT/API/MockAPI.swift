//
//  MockAPI.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import Foundation

class MockAPI: API {
    static func fetchPosts(
        subreddit: String,
        after: String,
        completion: @escaping ([Post], String?) -> Void
    ) {
        // return a pre-defined set of mock posts
        let mockPosts = [
            Post(
                id: "123",
                title: "Mock post 1",
                thumbnail: "https://via.placeholder.com/150",
                subreddit: "mock",
                score: 100,
                author: "MockAuthor",
                created: Date().timeIntervalSince1970,
                num_comments: 10,
                permalink: ""
            ),
            Post(
                id: "456",
                title: "Mock post 2",
                thumbnail: "https://via.placeholder.com/150",
                subreddit: "mock",
                score: 50,
                author: "MockAuthor",
                created: Date().timeIntervalSince1970,
                num_comments: 5,
                permalink: ""
            )
        ]
        completion(mockPosts, "")
    }

    static func fetchComments(
        postId: String,
        completion: @escaping ([Comment]) -> Void
    ) {
        // return a pre-defined set of mock comments
        let mockComments = [
            Comment(
                id: "123",
                body: "Mock comment 1",
                author: "MockAuthor",
                score: 100,
                created: Date().timeIntervalSince1970
            ),
            Comment(
                id: "456",
                body: "Mock comment 2",
                author: "MockAuthor",
                score: 50,
                created: Date().timeIntervalSince1970)
        ]
        completion(mockComments)
    }
}

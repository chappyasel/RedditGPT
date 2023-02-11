//
//  RedditAPI.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import Foundation

protocol API {
    static func fetchPosts(
        subreddit: String,
        after: String,
        completion: @escaping ([Post], String?) -> Void
    )

    static func fetchComments(
        postId: String,
        completion: @escaping ([Comment]) -> Void
    )
}

class RedditAPI {
    static func fetchPosts(
        subreddit: String,
        after: String,
        completion: @escaping ([Post], String?) -> Void
    ) {
        var urlString = "https://www.reddit.com/r/\(subreddit)/top.json"
        if after != "" {
            urlString += "?after=\(after)"
        }
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion([], nil)
                return
            }
            guard let data = data else {
                print("Error: no data received from the API")
                completion([], nil)
                return
            }
            do {
                let redditData = try JSONDecoder().decode(RedditData.self, from: data)
                let posts = redditData.data.children.map{$0.data}
                let after = redditData.data.after
                completion(posts, after)
            } catch let decodingError {
                print("Error: \(decodingError.localizedDescription)")
                completion([], nil)
            }
        }
        .resume()
    }

    static func fetchComments(
        postId: String,
        completion: @escaping ([Comment]) -> Void
    ) {
        let urlString = "https://www.reddit.com/comments/\(postId).json"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion([])
                return
            }
            guard let data = data else {
                print("Error: no data received from the API")
                completion([])
                return
            }
            do {
                let commentsData = try JSONDecoder().decode([CommentData].self, from: data)
                let comments = commentsData[1].data.children.map{$0.data}
                completion(comments)
            } catch let decodingError {
                print("Error: \(decodingError.localizedDescription)")
                completion([])
            }
        }
        .resume()
    }
}

extension RedditAPI: API {}

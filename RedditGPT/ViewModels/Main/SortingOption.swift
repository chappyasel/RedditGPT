//
//  SortingOption.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import Foundation

enum SortingOption: String, CaseIterable {
    case score = "Score"
    case date = "Date"
    case comments = "Comments"
    case author = "Author"
    case subreddit = "Subreddit"
    // Add more cases as needed

    var sort: (Post, Post) -> Bool {
        switch self {
        case .score:
            return { $0.score > $1.score }
        case .date:
            return { $0.created > $1.created }
        case .comments:
            return { $0.num_comments > $1.num_comments }
        case .author:
            return { $0.author < $1.author }
        case .subreddit:
            return { $0.subreddit < $1.subreddit }
        }
    }
}

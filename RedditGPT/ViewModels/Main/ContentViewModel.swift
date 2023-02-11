//
//  ContentViewModel.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var subreddit: String = "all"
    @Published var sortingOption: SortingOption = .score
    @Published var isLoading = false
    private var after: String = ""
    private var previousSubreddit: String = ""

    func loadData() {
        isLoading = true
        if subreddit != previousSubreddit {
            posts = []
            after = ""
            previousSubreddit = subreddit
        }
        RedditAPI.fetchPosts(subreddit: subreddit, after: after) { (posts, after) in
            self.posts += posts.sorted(by: self.sortingOption.sort)
            self.after = after ?? ""
            self.isLoading = false
        }
    }
}

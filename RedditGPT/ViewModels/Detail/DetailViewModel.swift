//
//  DetailViewModel.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var post: Post
    @Published var comments: [Comment] = []
    @Published var showTopView = true

    init(post: Post) {
        self.post = post
        RedditAPI.fetchComments(postId: post.id) { comments in
            self.comments = comments
        }
    }
}

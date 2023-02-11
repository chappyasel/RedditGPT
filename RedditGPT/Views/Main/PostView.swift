//
//  PostView.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import SwiftUI

struct PostView: View {
    let post: Post

    var body: some View {
        HStack {
            if post.thumbnail != "" {
                ImageView(url: post.thumbnail)
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
                    .shadow(radius: 3)
            }
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .padding(.bottom, 4)
                Text("Score: \(post.score)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Subreddit: \(post.subreddit)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
}

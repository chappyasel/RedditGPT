//
//  DetailView.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel

    init(post: Post) {
        self.viewModel = DetailViewModel(post: post)
    }

    var body: some View {
        VStack {
            if viewModel.showTopView {
                PostDetailsView(post: viewModel.post)
            }
            CommentsView(comments: viewModel.comments)
        }
        .transition(.slide)
        .animation(.default)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                withAnimation {
                    self.viewModel.showTopView.toggle()
                }
            }) {
                Image(systemName: self.viewModel.showTopView ? "arrow.up" : "arrow.down")
            }
        )
    }
}

struct CommentsView: View {
    let comments: [Comment]

    var body: some View {
        List(comments) { comment in
            VStack(alignment: .leading) {
                Text(comment.body ?? "")
                    .font(.body)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                HStack {
                    Text("by \(comment.author ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(comment.scoreText ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                Text("\(comment.createdDate?.description ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
        }
    }
}

struct PostDetailsView: View {
    let post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageView(url: post.thumbnail)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .clipped()
            Text(post.title)
                .font(.title)
                .lineLimit(nil)
                .padding(.horizontal, 16)
            HStack {
                Text("Subreddit: \(post.subreddit)")
                    .font(.subheadline)
                Spacer()
                Text("Score: \(post.score)")
                    .font(.subheadline)
            }
            .padding(.horizontal, 16)
            HStack {
                Text("Author: \(post.author)")
                    .font(.subheadline)
                Spacer()
                Text("Created: \(post.created.timeAgoSinceDate())")
                    .font(.subheadline)
            }
            .padding(.horizontal, 16)
            HStack {
                Text("Comments: \(post.num_comments)")
                    .font(.subheadline)
                Spacer()
            }
            .padding(.horizontal, 16)
        }
    }
}

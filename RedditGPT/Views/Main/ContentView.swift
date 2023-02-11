//
//  ContentView.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @State private var searchTerm = ""

    var body: some View {
        NavigationView {
            VStack {
                HeaderView(subreddit: $viewModel.subreddit, sortingOption: $viewModel.sortingOption, onSearch: viewModel.loadData)

                List {
                    ForEach(viewModel.posts.filter {
                        self.searchTerm.isEmpty ? true : $0.title.contains(self.searchTerm)
                    }, id: \.id) { post in
                        NavigationLink(destination: DetailView(post: post)) {
                            PostView(post: post)
                        }
                    }
                }
                .animation(.default)
                .navigationBarTitle(Text("RedditGPT"))
                .navigationBarItems(leading:
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $searchTerm, onEditingChanged: { _ in })
                    }
                )
                .navigationBarItems(trailing:
                    Button(action: viewModel.loadData) {
                        HStack {
                            Image(systemName: "arrow.2.circlepath")
                            Text("Load more")
                        }
                    }
                    .disabled(viewModel.isLoading)
                    .opacity(viewModel.isLoading ? 0.5 : 1)
                )
                .accentColor(Color.orange)
                .background(Color.gray)
            }
        }
        .onAppear(perform: viewModel.loadData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

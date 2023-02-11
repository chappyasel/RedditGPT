//
//  HeaderView.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var subreddit: String
    @Binding var sortingOption: SortingOption
    var onSearch: () -> Void

    var body: some View {
        HStack {
            TextField("Enter subreddit name", text: $subreddit)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
                .foregroundColor(Color.orange)
            Picker("Sort by:", selection: $sortingOption) {
                ForEach(SortingOption.allCases, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .accentColor(Color.orange)
            Button(action: onSearch) {
                HStack {
                    Image(systemName: "arrow.2.circlepath")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("Refresh")
                }
            }
            .foregroundColor(Color.orange)
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}

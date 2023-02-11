//
//  ImageView.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import SwiftUI

struct ImageView: View {
    let url: String

    var body: some View {
        if url != "" {
            return Image.init(uiImage: self.loadImage(url))
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        return Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }

    func loadImage(_ url: String) -> UIImage {
        guard let imageUrl = URL(string: url) else { return UIImage() }
        guard let imageData = try? Data(contentsOf: imageUrl) else { return UIImage() }
        return UIImage(data: imageData)!
    }
}

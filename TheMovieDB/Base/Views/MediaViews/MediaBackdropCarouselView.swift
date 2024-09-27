//
//  MediaBackdropCarouselView.swift
//  TheMovieDB
//
//  Created by Nour el houda Akbi on 27/9/2024.
//

import SwiftUI

struct MediaBackdropCarouselView: View {
    let content: [Media]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 20) {
                ForEach(content) { movie in
                    NavigationLink(value: movie) {
                        MediaBackdropCardView(content: movie)
                            .frame(width: 332)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.leading)
        }
    }
}

#Preview {
    NavigationStack {
        MediaBackdropCarouselView(content: Media.localMovies)
    }
}

#Preview {
    NavigationStack {
        MediaBackdropCarouselView(content: Media.localTVs)
    }
}

//
//  MediaDetailTitle.swift
//  TheMovieDB
//
//  Created by Nour el houda Akbi on 27/9/2024.
//

import SwiftUI

struct MediaDetailTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.bold)
    }
}

struct MovieDetailTitle_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailTitle(text: "Hello")
    }
}

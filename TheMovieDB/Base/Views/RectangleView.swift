//
//  RectangleView.swift
//  TheMovieDB
//
//  Created by Nour el houda Akbi on 27/9/2024.
//

import SwiftUI

struct RectangleView: View {
            
    var body: some View {
        Rectangle()
            .foregroundColor(.gray)
            .opacity(0.3)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}

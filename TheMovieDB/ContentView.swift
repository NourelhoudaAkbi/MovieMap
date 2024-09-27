//
//  ContentView.swift
//  TheMovieDB

//  Created by Nour el houda Akbi on 27/9/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        // bottom nav bar
        TabView {
            MovieListView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }
            TVListView()
                .tabItem {
                    Label("TV Show", systemImage: "sparkles.tv")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            
        }
        .onAppear {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

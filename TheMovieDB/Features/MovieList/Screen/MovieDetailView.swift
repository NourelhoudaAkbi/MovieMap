//
//  MovieDetailView.swift
//  TheMovieDB
//
//  Created by Nour el houda Akbi on 27/9/2024.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var vm = MovieDetailViewModel()
    
    let id: Int
    
    var body: some View {
        VStack {
            if vm.media != nil {
                ContentDetailView(content: vm.media!)
            }
        }
        .task {
            await vm.fetchDetails(for: id)
        }
        .overlay {
            if vm.viewState == .loading {
                ProgressView()
            }
        }
        .alert(isPresented: $vm.hasError, error: vm.error) {
            Button("Retry") {
                Task {
                    await vm.fetchDetails(for: id)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetailView(id: Media.localMovie.id)
    }
}

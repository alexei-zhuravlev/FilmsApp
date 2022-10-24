//
//  DetailedMovieScreen.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 19.10.2022.
//

import SwiftUI

struct DetailedMovieScreen: View {
    
    var movie = ListOfMovies(id: 0, original_title: "", poster_path: "", release_date: "", overview: "", vote_average: 0, backdrop_path: "")
    
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: (TMDBDetails().urlToImagePath + movie.poster_path))) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFit()
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 3, y: 10)

            HStack {
                ForEach(0..<Int(movie.vote_average), id:\.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding()
            Text(movie.original_title)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Text(movie.overview)
        }
        .padding()
    }
}

struct DetailedMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailedMovieScreen()
    }
}

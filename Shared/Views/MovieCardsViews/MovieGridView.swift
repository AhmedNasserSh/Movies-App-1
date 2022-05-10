//
//  MovieGridView.swift
//  MoviesApp
//
//  Created by Ahmed Ragab on 10/05/2022.
//

import SwiftUI

enum UIUserInterfaceIdiom : Int {
    case unspecified
    case phone // iPhone and iPod touch style UI
    case pad   // iPad style UI (also includes macOS Catalyst)
}

struct MovieGridView: View {
   
    let movies:[Movie]
    
    var body: some View {
      
        ScrollView(.vertical, showsIndicators: false) {
            
                VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 8)]) {
                    ForEach(movies) { item in
                        GeometryReader { proxy in
                        VStack(spacing:16) {
                            
                                BackDropCardView(movie:item)

                            Text(item.title ?? "")
                                .font(.headline)
                                .fontWeight(.bold)
                            HStack {
                                Spacer()
                                Text(item.overview)
                                    .font(.subheadline)
                                Spacer()
                            }
                            Spacer()
                        }

                      }
                        
                        .frame(minHeight:
                                UIDevice.current.userInterfaceIdiom == .pad ?
                               360:250,maxHeight:UIScreen.main.bounds.height)
                    .background(Color(uiColor: .systemBackground))
                    .mask(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 4)
                      
                    }
                }
            }

          }
        
    }
    
}



struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridView(movies: Movie.stubbedMovies)
      
    }
}

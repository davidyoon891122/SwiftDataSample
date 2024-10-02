//
//  MovieView.swift
//  SwiftDataExample
//
//  Created by Jiwon Yoon on 10/2/24.
//

import SwiftUI
import SwiftData

struct MovieView: View {
    @Query(sort: \Movie.title) var movies: [Movie]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            List {
                ForEach(movies) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)

                        Text(movie.cast.formatted(.list(type: .and)))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("MovieDB")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button("Add Sample", action: addSample)
                }
            }
            
        }
    }

    func addSample() {
        withAnimation {
            let movie = Movie(title: "Avatar", cast: ["Sam Worthington", "Zoe Saldaña", "Stephen Lang", "Michelle Rodriguez"])
            modelContext.insert(movie)

            try? modelContext.save()
        }
    }

    func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
            try? modelContext.save()
        }
    }

}

#Preview {
    MovieView()
        .modelContainer(for: Movie.self, inMemory: true)
}

//
//  MovieViewModel.swift
//  SwiftDataExample
//
//  Created by Jiwon Yoon on 10/2/24.
//

import Foundation
import SwiftData

protocol MovieViewModelProtocol: ObservableObject {

    var modelContext: ModelContext { get }
    var movies: [Movie] { get }

    func fetchData()
    func addSample()
    func deleteItem(offsets: IndexSet)

}


final class MovieViewModel {

    var modelContext: ModelContext
    @Published var movies: [Movie] = []

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

}

extension MovieViewModel: MovieViewModelProtocol {

    func fetchData() {
        do {
            let descriptor = FetchDescriptor<Movie>(sortBy: [SortDescriptor(\.title)])
            movies = try modelContext.fetch(descriptor)

        } catch {
            print("Fetch failed: \(error.localizedDescription)")
        }
    }

    func addSample() {
        let movie = Movie(title: "Avatar", cast: ["Sam Worthington", "Zoe Saldaña", "Stephen Lang", "Michelle Rodriguez"])
        modelContext.insert(movie)

        do {
            try modelContext.save()
        } catch {
            print("Fetch failed: \(error.localizedDescription)")
        }

        fetchData()
    }

    func deleteItem(offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(movies[index])
        }
        do {
            try modelContext.save()
        } catch {
            print("Fetch failed: \(error.localizedDescription)")
        }

        fetchData()
    }

}

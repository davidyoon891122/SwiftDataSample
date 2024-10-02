//
//  MovieView.swift
//  SwiftDataExample
//
//  Created by Jiwon Yoon on 10/2/24.
//

import SwiftUI
import SwiftData

struct MovieView<Model>: View where Model: MovieViewModelProtocol {

    @ObservedObject private var viewModel: Model

    init(viewModel: Model) {
        self.viewModel = viewModel
    }


    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.movies) { movie in
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)

                        Text(movie.cast.formatted(.list(type: .and)))
                    }
                }
                .onDelete(perform: viewModel.deleteItem)
            }
            .navigationTitle("MovieDB")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button("Add Sample", action: viewModel.addSample)
                }
            }
            
        }
        .onAppear {
            viewModel.fetchData()
        }
    }

}

#Preview {
    let modelContext = ModelContext(try! ModelContainer(for: Movie.self))

    MovieView(viewModel: MovieViewModel(modelContext: modelContext))

}

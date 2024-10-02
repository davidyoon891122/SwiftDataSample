//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Jiwon Yoon on 10/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) var modelContext

    var body: some View {
        MovieView(viewModel: MovieViewModel(modelContext: modelContext))
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}

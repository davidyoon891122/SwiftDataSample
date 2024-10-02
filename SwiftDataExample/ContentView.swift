//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Jiwon Yoon on 10/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        MovieView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}

//
//  Movie.swift
//  SwiftDataExample
//
//  Created by Jiwon Yoon on 10/2/24.
//

import Foundation
import SwiftData

@Model
final class Movie {

    var title: String
    var cast: [String]

    init(title: String, cast: [String]) {
        self.title = title
        self.cast = cast
    }

}

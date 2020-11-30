/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

class MovieStore: ObservableObject {
  static let moviesKey = "Movies"
  static let defaultMovies = [
    Movie(title: "A Cat in Paris", genre: .family, rating: 5),
    Movie(title: "Pet Sematary", genre: .horror, rating: 3.5),
    Movie(title: "The Cat Returns", genre: .animation, rating: 4)
  ]

  static func loadMovies() -> [Movie] {
    let savedMovies = UserDefaults.standard.object(forKey: MovieStore.moviesKey)
    if let savedMovies = savedMovies as? Data {
      let decoder = JSONDecoder()
      return (try? decoder.decode([Movie].self, from: savedMovies))
        ?? MovieStore.defaultMovies
    }
    return MovieStore.defaultMovies
  }

  @Published var movies = loadMovies() {
    didSet {
      persistMovies()
    }
  }

  func addMovie(title: String, genre: Genre, rating: Double) {
    let newMovie = Movie(title: title, genre: genre, rating: rating)
    movies.append(newMovie)
  }

  func deleteMovie(at offsets: IndexSet) {
    movies.remove(atOffsets: offsets)
  }

  private func persistMovies() {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(movies) {
      UserDefaults.standard.set(encoded, forKey: MovieStore.moviesKey)
    }
  }
}

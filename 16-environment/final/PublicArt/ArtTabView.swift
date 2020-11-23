/// Copyright (c) 2019 Razeware LLC
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
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ArtTabView: View {
  @State var artworks = artData
  
  var body: some View {
    TabView {
      NavigationView {
        ArtList(artworks: $artworks, tabTitle: "All Artworks", hideVisited: false)
        DetailView(artwork: artworks[0])
      }
      .tabItem({
        Text("Artworks 💕 🙏 🌟")
      })
      
      NavigationView {
        ArtList(artworks: $artworks, tabTitle: "Unvisited Artworks", hideVisited: true)
        DetailView(artwork: artworks[0])
      }
      .tabItem({ Text("Unvisited Artworks") })
    }
  }
}

struct ArtTabView_Previews: PreviewProvider {
  static var previews: some View {
    ArtTabView()
  }
}

struct ArtList: View {
  @Binding var artworks: [Artwork]
  let tabTitle: String
  let hideVisited: Bool
  
  var showArt: [Artwork] {
    hideVisited ? artworks.filter { $0.reaction == "" } : artworks
  }
  
  private func setReaction(_ reaction: String, for item: Artwork) {
    if let index = artworks.firstIndex(
      where: { $0.id == item.id }) {
      artworks[index].reaction = reaction
    }
  }
  
  var body: some View {
    List(showArt) { artwork in
      NavigationLink(
      destination: DetailView(artwork: artwork)) {
        Text("\(artwork.reaction)  \(artwork.title)")
          .onAppear() { artwork.load() }
          .contextMenu {
            Button("Love it: 💕") {
              self.setReaction("💕", for: artwork)
            }
            Button("Thoughtful: 🙏") {
              self.setReaction("🙏", for: artwork)
            }
            Button("Wow!: 🌟") {
              self.setReaction("🌟", for: artwork)
            }
        }
      }
    }
    .navigationBarTitle(tabTitle)
  }
}

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

import SwiftUI

struct ContentView: View {
  let mix = MeowMix()
  @State private var showMessage = false
  
  var body: some View {
    NavigationView {
      VStack(spacing: 0.0) {
        MeowMixHeader()
          .padding()
          .onTapGesture {
            showMessage = true
          }
          .popover(isPresented: $showMessage, content: {
            MessagePopover()
          })
        
        Divider()
          .padding()
        
        List(mix.tracks) { track in
          NavigationLink(
            destination: DetailView(track: track),
            label: {
              TrackRow(track: track)
            })
        }
        
        FeaturedCats(artists: mix.tracks.map(\.artist))
          .padding(.vertical)
          .background(Color.gray.opacity(0.2))
      }
      .navigationBarHidden(true)
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct DetailView: View {
  let track: Track
  
  var body: some View {
    ZStack {
      track.gradient
        .ignoresSafeArea()
      
      VStack {
        Text(track.title)
          .font(.largeTitle)
          .fontWeight(.black)
        Text(track.artist)
          .font(.title)
          .fontWeight(.semibold)
        
        track.thumbnail
          .resizable()
          .scaledToFit()
          .padding(50)
      }
      .foregroundColor(.white)
    }
  }
}

struct MessagePopover: View {
  var body: some View {
    Text("These cats are not available in your region 😿")
      .font(.title)
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let mix = MeowMix()
    
    ContentView()
    DetailView(track: mix.tracks[0])
  }
}


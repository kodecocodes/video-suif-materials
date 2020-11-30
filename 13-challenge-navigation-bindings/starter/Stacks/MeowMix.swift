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

struct Track: Identifiable {
  let id = UUID()
  let title: String
  let artist: String
  let duration: String
  
  let thumbnail = Image(systemName: "heart")
  let gradient: LinearGradient = {
    let colors: [Color] = [.orange, .pink, .purple, .red, .yellow]
    return LinearGradient(gradient: Gradient(colors: [colors.randomElement()!, colors.randomElement()!]), startPoint: .center, endPoint: .topTrailing)
  }()
}

struct MeowMix {
  let tracks = [
    Track(title: "Cool Cat", artist: "Keyboard Cat", duration: "0:29"),
    Track(title: "The Lovecats", artist: "The Cure", duration: "3:40"),
    Track(title: "Katamari on the Moog", artist: "Akitaka Tohyama, Yu Miyake", duration: "0:33"),
    Track(title: "A Sunday Morning Meditation", artist: "ambientcat", duration: "1:17"),
    Track(title: "Here Comes Santa Claws", artist: "Jingle Cats", duration: "2:21"),
    Track(title: "Be a Safe Rider", artist: "Safe-T Rider", duration: "5:05"),
    Track(title: "Jellicle Songs For Jellicle Cats", artist: "Andrew Lloyd Webber & 'Cats' 1983 Broadway Cast", duration: "5:17"),
    Track(title: "Cat Scratch Fever", artist: "Ted Nugent", duration: "3:37"),
    Track(title: "This Cat's On a Hot Tin Roof", artist: "The Brian Setzer Orchestra", duration: "2:55")
  ]
}

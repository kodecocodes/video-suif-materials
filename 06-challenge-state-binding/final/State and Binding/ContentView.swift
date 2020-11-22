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

enum Mood: String {
  case happy = "😀"
  case sad = "☹️"
  case upsidedown = "🙃"
  case cat = "🐱"
}

struct ContentView: View {
  @State private var name: String = ""
  @State private var favoriteColor: Color = .green
  @State private var mood: Mood = .happy
  
  var body: some View {
    VStack {
      StatusControl(name: $name, favoriteColor: $favoriteColor, mood: $mood)
        .padding()
      
      StatusIcon(name: name, favoriteColor: favoriteColor, mood: mood)
        .padding()
    }
  }
}

struct StatusControl: View {
  @Binding var name: String
  @Binding var favoriteColor: Color
  @Binding var mood: Mood
  
  var body: some View {
    VStack {
      TextField("Name", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      
      ColorPicker("Favorite Color", selection: $favoriteColor)
      
      Picker("Mood", selection: $mood) {
        Text(Mood.happy.rawValue).tag(Mood.happy)
        Text(Mood.sad.rawValue).tag(Mood.sad)
        Text(Mood.upsidedown.rawValue).tag(Mood.upsidedown)
        Text(Mood.cat.rawValue).tag(Mood.cat)
      }
      .pickerStyle(SegmentedPickerStyle())
    }
  }
}

struct StatusIcon: View {
  let name: String
  let favoriteColor: Color
  let mood: Mood
  
  var body: some View {
    VStack {
      Text(mood.rawValue)
      Text(name)
        .foregroundColor(.white)
    }
    .font(.largeTitle)
    .padding()
    .background(favoriteColor)
    .cornerRadius(12)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

/// Copyright (c) 2023 Kodeco LLC
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
  let weather = Weather()
  
    var body: some View {
      VStack(alignment: .leading, spacing: 20.0) {
        CurrentConditions()
        
        Divider()
        
        HStack {
          ForEach(weather.hourlyForecast, id: \.hour) { forecast in
            Spacer()
            HourlyForecast(forecast: forecast)
            Spacer()
          }
        }
      }
      .padding()
      .foregroundColor(.white)
      .background(
        Color("lightBlue")
      )
    }
}

struct Weather {
  struct Forecast {
    let hour: String
    let conditions: Image
    let temperature: String
  }
  
  let hourlyForecast = [
    Forecast(hour: "8AM", conditions: Image(systemName: "sun.max.fill"), temperature: "63°"),
    Forecast(hour: "9AM", conditions: Image(systemName: "cloud.sun.fill"), temperature: "63°"),
    Forecast(hour: "10AM", conditions: Image(systemName: "sun.max.fill"), temperature: "64°"),
    Forecast(hour: "11AM", conditions: Image(systemName: "cloud.fill"), temperature: "61°"),
    Forecast(hour: "12PM", conditions: Image(systemName: "cloud.rain.fill"), temperature: "62°")
  ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Image("challenge")
        .resizable()
        .scaledToFit()
        .previewLayout(.sizeThatFits)
      
      ContentView()
        .previewLayout(.sizeThatFits)
    }
}

struct HourlyForecast: View {
  let forecast: Weather.Forecast
  
  var body: some View {
    VStack {
      Text(forecast.hour)
      
      forecast.conditions
        .renderingMode(.original)
        .frame(height: 50)
      
      Text(forecast.temperature)
    }
  }
}

struct CurrentConditions: View {
  var body: some View {
    HStack(alignment: .lastTextBaseline) {
      VStack(alignment: .leading) {
        Text("Cupertino")
          .font(.title3)
        Text("63°")
          .font(.largeTitle)
      }
      
      Spacer()
      
      VStack(alignment: .trailing) {
        Image(systemName: "sun.max.fill")
          .renderingMode(.original)
        
        Text("Sunny")
        Text("H:68° L:42°")
      }
    }
  }
}

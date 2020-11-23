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

import MapKit
import SwiftUI

struct Artwork {
  let id = UUID()
  let artist: String
  let description: String
  let locationName: String
  let discipline: String
  let title: String
  let imageName: String
  let coordinate: CLLocationCoordinate2D
  var reaction: String

  func load() {
    print(">>>>> Downloading \(self.imageName) <<<<<")
  }
}

extension Artwork: Identifiable { }

// Subset of Honolulu Public Art data set at
// https://data.honolulu.gov/dataset/Public-Art/yef5-h88r
// Note: The current imagefile server is different from what's listed.
// Current URLs are in image-urls.txt in the starter folder.

let artData = [
  Artwork(artist: "Sean Browne", description: "Bronze figure of Prince Jonah Kuhio Kalanianaole", locationName: "Kuhio Beach", discipline: "Sculpture", title: "Prince Jonah Kuhio Kalanianaole", imageName: "002_200105", coordinate: CLLocationCoordinate2D(latitude: 21.273389, longitude: -157.823802), reaction: ""),
  Artwork(artist: "Robert Lee Eskridge", description: "One of a pair of murals at Ala Mona Regional Park. A Works Progress Administration art project, done in the Art Deco style. It depicts various aspects of makahiki (harvest festival), imagined as taking place in the vicinity of what is now known as Ala Moana Park, makahiki pa'ani ho'oikaika (annual sports tournaments) are emphasized. This mural depicts ali'i with their retainers traveling between villages by wa'a kaulua (double hulled canoe), a carving of Lono and kahili (feather standards) accompany them. Puowaina (Punchbowl) is shown in the background. Also depicted is he'e nalu (surfing) on olo (long surfboard) and 'o'o ihe (sport of spear throwing) whereby a group of men, at a given signal, hurl their spears at one man who would either catch the spears, dodge them, or otherwise fend them off.", locationName: "Lester McCoy Pavilion", discipline: "Mural", title: "Makahiki Festival Mauka Mural", imageName: "19300102", coordinate: CLLocationCoordinate2D(latitude: 21.290959, longitude: -157.851265), reaction: ""),
  Artwork(artist: "Kate Kelly", description: "A cast bronze commemorative plaque set into a monolith. The plaque memorializes Amelia Earhart's first flight to Hawaii in 1935.", locationName: "Diamond Head Lookout/Kuilei Beach Cliffs", discipline: "Plaque", title: "Amelia Earhart Memorial Plaque", imageName: "193701", coordinate: CLLocationCoordinate2D(latitude: 21.256139, longitude: -157.804769), reaction: "🙏"),
  Artwork(artist: "Marguerite Louis Blasingame", description: "The stone bas relief entry way to the 1939 Board of Water Supply building. The bas relief is executed on a series of green steatite stone blocks which depict mythical and human Hawaiian figures, flora, and animals in the upper portions flanking either side of a central doorway as well as stylized letter forming a narrative text beneath the figurative panels. The two panels, one on the Diamond Head side of the entry way and the other on the other side of the entry door both depict stories involving the god Kane and Kaneloa in a mythical story about the discovery and use of water.", locationName: "Board of Water Supply Engineering Building Entrance", discipline: "Mural", title: "Ka Wai Ake Akua", imageName: "193901-5", coordinate: CLLocationCoordinate2D(latitude: 21.306108, longitude: -157.852555), reaction: ""),
  Artwork(artist: "Juliette May Fraser", description: "A mural depicting various agricultural activities occurring in Hawaii over several time periods, from pre-contact to the 20th century.", locationName: "Board of Water Supply Building Lobby", discipline: "Mural", title: "Pure Water: Man's Greatest Need", imageName: "195801", coordinate: CLLocationCoordinate2D(latitude: 21.306008, longitude: -157.853896), reaction: ""),
  Artwork(artist: "Charles Watson", description: "A stylized sculpture of a giraffe with the body made of welded rebar rings. The body is articulated by using weld material to give the spotty look of the animal. The head is approximately 12\" long and it peers down, its mouth open, and with long eyelashes. There are ears and horns on its head and there are iron rods of about 4-6\" in length that are used to articulate the hairs on the back of the giraffe's neck.", locationName: "Honolulu Zoo Elephant Exhibit", discipline: "Sculpture", title: "Giraffe", imageName: "198912", coordinate: CLLocationCoordinate2D(latitude: 21.270449, longitude: -157.819816), reaction: ""),
  Artwork(artist: "Yoshinari Kochi", description: "A roughly carved \"C\" form which represents \"century,\" supported by a pillar with four Chinese characters on the sides which signify that \"blessings from heaven are invoked by peace and harmony.\" The sculpture commemorates the 75th anniversary of the first Japanese immigrants to arrive in Hawaii.", locationName: "Foster Botanical Garden", discipline: "Sculpture", title: "Hiroshima Monument", imageName: "196001", coordinate: CLLocationCoordinate2D(latitude: 21.316633, longitude: -157.858247), reaction: "🙏"),
  Artwork(artist: "Unknown", description: "Bronze plaque mounted on a stone with an inscription marking the site of an artesian well.", locationName: "1922 Wilder Avenue", discipline: "Plaque", title: "Pioneer Artesian Well Site", imageName: "193301-2", coordinate: CLLocationCoordinate2D(latitude: 21.30006, longitude: -157.827969), reaction: ""),
  Artwork(artist: "Unknown", description: "Bronze \"Roll of Honor\" plaque listing 101 Hawaii citizens killed in World War I.", locationName: "Queen's Beach", discipline: "Plaque", title: "Roll of Honor", imageName: "193101", coordinate: CLLocationCoordinate2D(latitude: 21.26466, longitude: -157.821463), reaction: ""),
  Artwork(artist: "Unknown", description: "Bronze plaque honoring Don Francisco de Paula Marin.", locationName: "Marin Tower Courtyard", discipline: "Plaque", title: "Francisco De Paula Marin Residence", imageName: "199909", coordinate: CLLocationCoordinate2D(latitude: 21.311242, longitude: -157.864106), reaction: ""),
  Artwork(artist: "Sean Browne", description: "Larger than life-size bronze figure of King David Kalakaua mounted on a granite pedestal.", locationName: "Waikiki Gateway Park", discipline: "Sculpture", title: "King David Kalakaua", imageName: "199103-3", coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661), reaction: "🌟"),
  Artwork(artist: "I-Fan Chen", description: "Standing bronze figure of Dr. Sun Yat Sen installed on a pedestal.", locationName: "Sun Yat-Sen Mall", discipline: "Sculpture", title: "Sun Yat Sen", imageName: "197613-5", coordinate: CLLocationCoordinate2D(latitude: 21.314309, longitude: -157.861825), reaction: "🙏"),
  Artwork(artist: "Emiko Mizutani", description: "Mural of white glazed and semi-glazed ceramic tiles mounted on wood panels.", locationName: "Pali Golf Course Clubhouse Ballroom Entry", discipline: "Mural", title: "Trees", imageName: "199802", coordinate: CLLocationCoordinate2D(latitude: 21.37307, longitude: -157.785564), reaction: "🌟"),
  Artwork(artist: "Don Dugal", description: "A painted wall relief consisting of over 200 small painted panels affixed to a wall depicting a view of the ocean and horizon beyond tree trunks and branches done in subtle gray and blue tones.", locationName: "Medical Examiner Facility Entry", discipline: "Mural", title: "November Light", imageName: "198803", coordinate: CLLocationCoordinate2D(latitude: 21.315893, longitude: -157.867302), reaction: "💕"),
  Artwork(artist: "Elizabeth Mapelli", description: "A mosaic depicting tropical foliage against a starry sky.", locationName: "Alapai Police Station 1st Floor Entrance", discipline: "Mural", title: "Aloha Grotto", imageName: "199303-2", coordinate: CLLocationCoordinate2D(latitude: 21.304271, longitude: -157.851326), reaction: ""),
  Artwork(artist: "Marguerite Louis Blasingame", description: "One of a pair of low-relief marble tablets of a Hawaiian couple set into a wall.", locationName: "Lester McCoy Pavilion Banyan Court Garden", discipline: "Mural", title: "Hawaiian Couple", imageName: "19350202a", coordinate: CLLocationCoordinate2D(latitude: 21.291074, longitude: -157.851148), reaction: ""),
  Artwork(artist: "Paul Saviskas", description: "A stainless steel sculpture of three kihi kihi (Moorish idol fish) swimming around coral mounted on a concrete base.", locationName: "Hanauma Bay Visitor Center", discipline: "Sculpture", title: "Kihi Kihi", imageName: "200304", coordinate: CLLocationCoordinate2D(latitude: 21.273274, longitude: -157.694828), reaction: "💕")
]

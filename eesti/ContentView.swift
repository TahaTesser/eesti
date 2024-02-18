//
//  ContentView.swift
//  eesti
//
//  Created by Taha Tesser on 18.02.2024.
//

import SwiftUI
import ActivityKit

class EestiWord: ObservableObject {
    @Published var word: String = ""
    @Published var translation: String = ""
  
  init() {
    let randomIndex = Int.random(in: 0..<translations.count)
    let estonianWord = Array(translations.keys)[randomIndex]
    let englishTranslation = translations[estonianWord]!
    print("randomIndex", randomIndex)
    print("estonianWord", estonianWord)
    self.word = estonianWord
    self.translation = englishTranslation
  }
  
    let translations = [
      "Tere": "Hello",
      "Aitäh": "Thank you",
      "Palun": "Please",
      "Vabandage": "Excuse me",
      "Jah": "Yes",
      "Ei": "No",
      "Kus sa oled?": "Where are you?",
      "Ma olen hästi, aitäh. Kuidas sinuga?": "I'm fine, thank you. How are you?",
      "Ma armastan Eestit.": "I love Estonia.",
      "See on ilus päev.": "It's a beautiful day.",
      "Mul on hea meel teiega kohtuda.": "Nice to meet you.",
      "Näeme!": "See you!",
      "Head aega!": "Have a good time!",
      "Tere tulemast!": "Welcome!",
      "Hüvasti!": "Goodbye!",
    ]
}

struct ContentView: View {
  @StateObject var eestiWord = EestiWord()
  
  var body: some View {
      VStack(
        spacing: 0) {
          Rectangle()
            .fill(Color(hex: 0xff0073cf))
          ZStack() {
            Rectangle()
              .fill(Color(hex: 0xff000000))
            VStack() {
              Text(eestiWord.word).font(.title)
                .foregroundColor(.white)
                .padding(.bottom)
              Text(eestiWord.translation).font(.headline)
                .foregroundColor(.white)
            }
            .padding()
          }
          
          Rectangle()
            .fill(Color(hex: 0xffffffff))
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
              let attributes =  EestiAttributes()
          
              let initialState = EestiAttributes.ContentState(word: eestiWord.word, translation: eestiWord.translation)
          
              do {
                _ = try Activity<EestiAttributes>.request(attributes: attributes, content: ActivityContent(state: initialState, staleDate: nil))
              } catch let error {
                print(error.localizedDescription)
              }
        }
    }
}

#Preview {
    ContentView()
}

extension Color {
  init(hex: Int, opacity: Double = 1.0) {
    let red = Double((hex & 0xff0000) >> 16) / 255.0
    let green = Double((hex & 0xff00) >> 8) / 255.0
    let blue = Double((hex & 0xff) >> 0) / 255.0
    self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
  }
}

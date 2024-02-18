//
//  EestiAttributes.swift
//  eesti
//
//  Created by Taha Tesser on 18.02.2024.
//

import Foundation
import ActivityKit

struct EestiAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
      var word: String
      var translation: String
    }
}


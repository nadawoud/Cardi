//
//  Card.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 23/03/2021.
//

import Foundation
import Defaults

class Card: Codable, Defaults.Serializable {
    var title: String
    var description: String?
    var backTitle: String?
    var backDescription: String?
    var emoji: String?
    var correctlyAnswered: Bool?
    
    init(title: String,
         description: String? = nil,
         backTitle: String? = nil,
         backDescription: String? = nil,
         emoji: String? = nil,
         correctlyAnswered: Bool? = nil) {
        
      self.title = title
      self.description = description
      self.backTitle = backTitle
      self.backDescription = backDescription
      self.emoji = emoji
      self.correctlyAnswered = correctlyAnswered
    }
}

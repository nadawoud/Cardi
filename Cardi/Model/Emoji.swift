//
//  Emoji.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 01/12/2021.
//

import Foundation

struct EmojiCategory: Codable {
    let title: String
    let emojis: [Emoji]
}


struct Emoji: Codable {
    let no: Int
    let code, emoji, emojiDescription: String
    let flagged: Bool
    let keywords: [String]

    enum CodingKeys: String, CodingKey {
        case no, code, emoji
        case emojiDescription = "description"
        case flagged, keywords
    }
}

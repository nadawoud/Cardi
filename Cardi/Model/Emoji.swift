//
//  Emoji.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 01/12/2021.
//

import Foundation

struct EmojiCategory: Codable, Hashable {
    let title: String
    let emojis: [Emoji]
    
    static func == (lhs: EmojiCategory, rhs: EmojiCategory) -> Bool {
        return lhs.title == rhs.title
    }
}


struct Emoji: Codable, Hashable {
    let no: Int
    let code, emoji, emojiDescription: String
    let flagged: Bool
    let keywords: [String]

    enum CodingKeys: String, CodingKey {
        case no, code, emoji
        case emojiDescription = "description"
        case flagged, keywords
    }
    
    static func == (lhs: Emoji, rhs: Emoji) -> Bool {
        return lhs.emoji == rhs.emoji
    }
}

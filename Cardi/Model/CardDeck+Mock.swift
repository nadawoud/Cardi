//
//  CardDeck+Mock.swift
//  Cardi
//
//  Created by Nada Yehia Dawoud on 31/05/2021.
//

import Foundation

extension CardDeck {
    
    static let mockDeckList = [
        CardDeck(
            title: "Familie",
            cards: [
                Card(title: "Der Vatar", description: "Masculine Nomen", backTitle: "The Father", emoji: "👨🏻‍💼"),
                Card(title: "Die Mutter", description: "Feminin Nomen", backTitle: "The Mother", emoji: "👩🏻‍💼"),
                Card(title: "Die Tochter", description: "Feminin Nomen", backTitle: "The Daughter", emoji: "👧🏻"),
                Card(title: "Der Sohn", description: "Masculine Nomen", backTitle: "The Son", emoji: "👦🏻"),
                Card(title: "Der Opa", description: "Masculine Nomen", backTitle: "The Grandpa", emoji: "🧓🏼"),
                Card(title: "Die Oma", description: "Feminin Nomen", backTitle: "The Grandma", emoji: "👵🏻"),],
        coverEmoji: "👨‍👩‍👧‍👦"),
        
        CardDeck(
            title: "Obst",
            cards: [
                Card(title: "Der Apfel", description: "Masculine Nomen", backTitle: "The Apple", emoji: "🍎"),
                Card(title: "Die Banana", description: "Feminin Nomen", backTitle: "The Banana", emoji: "🍌"),
                Card(title: "Die Orange", description: "Feminin Nomen", backTitle: "The Orange", emoji: "🍊"),
                Card(title: "Die Erdeere", description: "Feminin Nomen", backTitle: "The Strawberry", emoji: "🍓"),
                Card(title: "Die Ananas", description: "Feminin Nomen", backTitle: "The Pineapple", emoji: "🍍"),],
        coverEmoji: "🍎"),
        
        CardDeck(
            title: "Gemüse",
            cards: [
                Card(title: "Der Pfeffer", description: "Masculine Nomen", backTitle: "The Pepper", emoji: "🫑"),
                Card(title: "Die Kartoffel", description: "Feminin Nomen", backTitle: "The Potato", emoji: "🥔"),
                Card(title: "Der Brokkoli", description: "Masculine Nomen", backTitle: "The Broccoli", emoji: "🥦"),
                Card(title: "Die Zitrone", description: "Feminin Nomen", backTitle: "The Lemon", emoji: "🍋"),
                Card(title: "Die Aubergiene", description: "Feminin Nomen", backTitle: "The Eggplant", emoji: "🍆"),],
        coverEmoji: "🫑"),
        
        CardDeck(
            title: "Hobbys",
            cards: [
                Card(title: "Fußball spielen", backTitle: "Playing football", emoji: "⚽️"),
                Card(title: "Singen", backTitle: "Singing", emoji: "🎤"),
                Card(title: "Lesen", backTitle: "Reading", emoji: "📖"),
                Card(title: "Schwimmen", backTitle: "Swimming", emoji: "🏊🏻‍♂️"),
                Card(title: "Filme Sehen", backTitle: "Watching Movies", emoji: "🎬"),],
        coverEmoji: "⚽️"),
    
        CardDeck(
            title: "Berufe",
            cards: [
                Card(title: "Der Arzt/ Die Ärztin", backTitle: "Doctor", emoji: "👩🏻‍⚕️"),
                Card(title: "Der Pilot/ Die Pilotin", backTitle: "Pilot", emoji: "👨🏻‍✈️"),
                Card(title: "Der Lehrer/ Die Lehrerin", backTitle: "Teacher", emoji: "👩🏽‍🏫"),
                Card(title: "Der Künstler/ Die Künstlerin", backTitle: "Artist", emoji: "👨🏻‍🎨"),
                Card(title: "Der Polizist/ Die Polizistin", backTitle: "Police Officer", emoji: "👮🏼"), ],
        coverEmoji: "👔")]
}

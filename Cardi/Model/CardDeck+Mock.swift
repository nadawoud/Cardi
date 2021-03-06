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
                Card(title: "Der Vatar", description: "Masculine Nomen", backTitle: "The Father", emoji: "π¨π»βπΌ"),
                Card(title: "Die Mutter", description: "Feminin Nomen", backTitle: "The Mother", emoji: "π©π»βπΌ"),
                Card(title: "Die Tochter", description: "Feminin Nomen", backTitle: "The Daughter", emoji: "π§π»"),
                Card(title: "Der Sohn", description: "Masculine Nomen", backTitle: "The Son", emoji: "π¦π»"),
                Card(title: "Der Opa", description: "Masculine Nomen", backTitle: "The Grandpa", emoji: "π§πΌ"),
                Card(title: "Die Oma", description: "Feminin Nomen", backTitle: "The Grandma", emoji: "π΅π»"),],
        coverEmoji: "π¨βπ©βπ§βπ¦"),
        
        CardDeck(
            title: "Obst",
            cards: [
                Card(title: "Der Apfel", description: "Masculine Nomen", backTitle: "The Apple", emoji: "π"),
                Card(title: "Die Banana", description: "Feminin Nomen", backTitle: "The Banana", emoji: "π"),
                Card(title: "Die Orange", description: "Feminin Nomen", backTitle: "The Orange", emoji: "π"),
                Card(title: "Die Erdeere", description: "Feminin Nomen", backTitle: "The Strawberry", emoji: "π"),
                Card(title: "Die Ananas", description: "Feminin Nomen", backTitle: "The Pineapple", emoji: "π"),],
        coverEmoji: "π"),
        
        CardDeck(
            title: "GemΓΌse",
            cards: [
                Card(title: "Der Pfeffer", description: "Masculine Nomen", backTitle: "The Pepper", emoji: "π«"),
                Card(title: "Die Kartoffel", description: "Feminin Nomen", backTitle: "The Potato", emoji: "π₯"),
                Card(title: "Der Brokkoli", description: "Masculine Nomen", backTitle: "The Broccoli", emoji: "π₯¦"),
                Card(title: "Die Zitrone", description: "Feminin Nomen", backTitle: "The Lemon", emoji: "π"),
                Card(title: "Die Aubergiene", description: "Feminin Nomen", backTitle: "The Eggplant", emoji: "π"),],
        coverEmoji: "π«"),
        
        CardDeck(
            title: "Hobbys",
            cards: [
                Card(title: "FuΓball spielen", backTitle: "Playing football", emoji: "β½οΈ"),
                Card(title: "Singen", backTitle: "Singing", emoji: "π€"),
                Card(title: "Lesen", backTitle: "Reading", emoji: "π"),
                Card(title: "Schwimmen", backTitle: "Swimming", emoji: "ππ»ββοΈ"),
                Card(title: "Filme Sehen", backTitle: "Watching Movies", emoji: "π¬"),],
        coverEmoji: "β½οΈ"),
    
        CardDeck(
            title: "Berufe",
            cards: [
                Card(title: "Der Arzt/ Die Γrztin", backTitle: "Doctor", emoji: "π©π»ββοΈ"),
                Card(title: "Der Pilot/ Die Pilotin", backTitle: "Pilot", emoji: "π¨π»ββοΈ"),
                Card(title: "Der Lehrer/ Die Lehrerin", backTitle: "Teacher", emoji: "π©π½βπ«"),
                Card(title: "Der KΓΌnstler/ Die KΓΌnstlerin", backTitle: "Artist", emoji: "π¨π»βπ¨"),
                Card(title: "Der Polizist/ Die Polizistin", backTitle: "Police Officer", emoji: "π?πΌ"), ],
        coverEmoji: "π")]
}

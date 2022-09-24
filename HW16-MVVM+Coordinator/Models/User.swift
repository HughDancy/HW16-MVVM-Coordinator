//
//  User.swift
//  HW16-MVVM+Coordinator
//
//  Created by Борис Киселев on 24.09.2022.
//

import Foundation

struct User {
    let name: String
    let userImage: String
    let dateOfBirth: String
    let profession: String
    let popularProject: String
}

extension User {
    static let users = [
        User(name: "Киану Ривз", userImage: "keanu", dateOfBirth: "2 сентября 1964", profession: "актер", popularProject: "Cyberpunk 2077"),
        User(name: "Мадс Микельсeн", userImage: "mads", dateOfBirth: "22 ноября 1965", profession: "актер", popularProject: "Ганнибал"),
        User(name: "Норман Ридус", userImage: "norman", dateOfBirth: "6 января 1969", profession: "актер", popularProject: "Death Stranding"),
        User(name: "Роберт Паттисон", userImage: "pattison", dateOfBirth: "13 мая 1986", profession: "актер", popularProject: "Бэтмен"),
        User(name: "Кори Тейлор", userImage: "corey", dateOfBirth: "8 декабря 1973", profession: "музыкант", popularProject: "Slipknot - IOWA"),
        User(name: "Курт Кобейн", userImage: "curt", dateOfBirth: "20 февраля 1967", profession: "музыкант", popularProject: "Nevermind"),
        User(name: "Акира Ямаока", userImage: "akira", dateOfBirth: "6 февраля 1968", profession: "композитор, музыкант", popularProject: "Silent Hill OST"),
        User(name: "Кэнтaро Миура", userImage: "miura", dateOfBirth: "11 июля 1966", profession: "мнгака", popularProject: "Berserk"),
        User(name: "Хидэо Кодзима", userImage: "hideo", dateOfBirth: "24 августа 1963", profession: "геймдизайнер", popularProject: "Death Stranding"),
        User(name: "Чарльз Буковски", userImage: "bukowsky", dateOfBirth: "16 августа 1920", profession: "писатель, литератор", popularProject: "Фактотум"),
        User(name: "Ева Грин", userImage: "eva", dateOfBirth: "6 июля 1980", profession: "актрисса", popularProject: "Sin City 2"),
        User(name: "Марго Роби", userImage: "margo", dateOfBirth: "2 июля 1990 ", profession: "актрисса", popularProject: "The Suicide Squad"),
        User(name: "Моника Беллучи", userImage: "monica", dateOfBirth: "30 сентября 1964", profession: "актрисса", popularProject: "Малена"),
        User(name: "Хоакин Феникc", userImage: "hoakin", dateOfBirth: "28 октября 1974", profession: "актер", popularProject: "Джокер")
        
    ]
}

var someUsers = [User(name: "Someone", userImage: "keanu", dateOfBirth: "01.01.1991", profession: "no one knows", popularProject: "nothing")]

var rightIndex = 0

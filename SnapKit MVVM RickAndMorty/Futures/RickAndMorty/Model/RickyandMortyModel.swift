//
//  RickyandMortyModel.swift
//  SnapKit MVVM RickAndMorty
//
//  Created by Kaan Yalçınkaya on 2.09.2022.
//

import Foundation

// MARK: - Welcome
struct PostModel: Codable {
    let info: Info?
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    
    enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: Species?
    let type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}


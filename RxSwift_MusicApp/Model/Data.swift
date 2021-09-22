//
//  Data.swift
//  RxSwift_MusicApp
//
//  Created by 黃瀞萱 on 2021/9/22.
//

import Foundation

struct Tracks: Codable {
    let data: [Track]
    let paging: Paging
    let summary: Summary
}

struct Track: Codable {
    let id: String
    let name: String
    let album: Album
}

struct Album: Codable {
    let id: String
    let name: String
    let image: [Image]
}

struct Image: Codable {
    let weight: Int
    let height: Int
    let url: String
}

struct Paging: Codable {
    let offset: Int
    let limit: Int
    let next: String
}

struct Summary: Codable {
    let total: Int
}

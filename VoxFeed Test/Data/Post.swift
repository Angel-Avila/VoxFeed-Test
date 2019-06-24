//
//  Post.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/22/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import Foundation

struct Post: Decodable {
    let id: String
    let date: String
    let socialNetwork: String
    let user: User
    let campaign: Campaign
    let brand: Brand
    let post: PostInfo
    let stats: Stats
    let earnings: Double
}

struct User: Decodable {
    let username: String
    let profileImage: String
}

struct Campaign: Decodable {
    let name: String
    let coverImage: String
}

struct Brand: Decodable {
    let name: String
    let logo: String
}

struct PostInfo: Decodable {
    let text: String
    let image: String
    let link: String
}

struct Stats: Decodable {
    let clicks: Int?
    let shares: Int
    let likes: Int
    let comments: Int
    let audience: Int
}

//
//  PostViewModel.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/22/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import Foundation

struct PostViewModel {
    let id: String
    let date: String
    let socialNetwork: String
    let username: String
    let profileImageURL: URL
    let campaignName: String
    let campaignImageURL: URL
    let brandName: String
    let brandImageURL: URL
    let postText: String
    let postImageURL: URL
    let postLink: URL
    let clicks: Int
    let shares: Int
    let likes: Int
    let comments: Int
    let audience: Int
    let earnings: Double
}

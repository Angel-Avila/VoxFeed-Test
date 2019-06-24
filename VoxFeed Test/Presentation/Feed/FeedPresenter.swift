//
//  FeedPresenter.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/22/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import RxSwift

enum FeedPresenterState {
    case fetching
    case fetched(postViewModels: [PostViewModel])
    case errorDownloading
}

protocol FeedPresenter {
    var feedStateObservable: Observable<FeedPresenterState>! { get }
    
    func fetchPosts()
}

class FeedPresenterImpl: FeedPresenter {
    
    private var feedStateSubject = PublishSubject<FeedPresenterState>()
    
    var feedStateObservable: Observable<FeedPresenterState>! {
        get {
            return feedStateSubject
        }
    }
    
    private let provider: PostProvider!
    
    init(withProvider provider: PostProvider) {
        self.provider = provider
        handleProviderState()
    }
    
    private func handleProviderState() {
        
        _ = provider.postStateObservable.subscribe(onNext: { state in
            switch state {
                
            case .fetching:
                self.feedStateSubject.on(.next(.fetching))
                
            case .fetched(let posts):
                let postViewModels = self.transformPosts(posts)
                self.feedStateSubject.on(.next(.fetched(postViewModels: postViewModels)))
                
            case .errorDownloading:
                self.feedStateSubject.on(.next(.errorDownloading))
            }
        })
        
    }
 
    func fetchPosts() {
        provider.fetchPosts()
    }
    
    private func transformPosts(_ posts: [Post]) -> [PostViewModel] {
        return posts.map { post in
            
            let id = post.id
            let date = post.date.dayString()
            let socialNetwork = post.socialNetwork
            let username = post.user.username
            let profileImageURL = URL(string: post.user.profileImage)!
            let campaignName = post.campaign.name
            let campaignImageURL = URL(string: post.campaign.coverImage)!
            let brandName = post.brand.name
            let brandImageURL = URL(string: post.brand.logo)!
            let postText = post.post.text
            let postImageURL = URL(string: post.post.image)!
            let postLink = URL(string: post.post.link)!
            let clicks = post.stats.clicks ?? 0
            let shares = post.stats.shares
            let likes = post.stats.likes
            let comments = post.stats.comments
            let audience = post.stats.audience
            let earnings = post.earnings
            
            return PostViewModel(id: id, date: date, socialNetwork: socialNetwork, username: username, profileImageURL: profileImageURL, campaignName: campaignName, campaignImageURL: campaignImageURL, brandName: brandName, brandImageURL: brandImageURL, postText: postText, postImageURL: postImageURL, postLink: postLink, clicks: clicks, shares: shares, likes: likes, comments: comments, audience: audience, earnings: earnings)
            
        }
    }
}

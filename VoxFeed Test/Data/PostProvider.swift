//
//  PostProvider.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/22/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import RxSwift
import Alamofire

enum PostProviderState {
    case fetching
    case fetched(posts: [Post])
    case errorDownloading
}

protocol PostProvider {
    var postStateObservable: Observable<PostProviderState>! { get }
    
    func fetchPosts()
}

class PostServices: PostProvider {
    
    private var posts = [Post]()
    
    private var postStateSubject = PublishSubject<PostProviderState>()
    
    var postStateObservable: Observable<PostProviderState>! {
        get {
            return postStateSubject
        }
    }
    
    func fetchPosts() {
        postStateSubject.on(.next(.fetching))
        
        _ = sendRequest(url: Router.posts, method: .get).subscribe(onNext: { (response: [Post]) in
            
            self.posts = response
            self.postStateSubject.on(.next(.fetched(posts: response)))
            
        }, onError: { error in
            print(error)
            self.postStateSubject.on(.next(.errorDownloading))
        })
    }
    
    func sendRequest<T>(url: URLConvertible, method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> Observable<T> where T: Decodable {
        return Observable.create { observable in
            
            
            Alamofire.request(url, method: method, parameters: parameters, headers: nil).responseJSON { response in
                
                if let error = response.error {
                    observable.onError(error)
                } else if let data = response.data {
                    let decoder = JSONDecoder()
                    
                    do {
                        let response = try decoder.decode(T.self, from: data)
                        observable.onNext(response)
                        
                    } catch let error {
                        observable.onError(error)
                    }
                }
            }
            
            return Disposables.create()
        }
    }
}

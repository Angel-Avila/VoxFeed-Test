//
//  Router.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/23/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import Foundation

import Alamofire

enum Router: URLConvertible {
    case posts
    
    static let baseURLString = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as! String
    
    // MARK: URLRequestConvertible
    
    func asURL() throws -> URL {
        let result: String = {
            switch self {
            case .posts:
                return "/promoted_messages"
            }
        }()
        
        let url = try Router.baseURLString.asURL()
        return url.appendingPathComponent(result)
    }
}

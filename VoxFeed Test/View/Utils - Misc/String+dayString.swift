//
//  String+dayString.swift
//  VoxFeed Test
//
//  Created by Angel Avila on 6/23/19.
//  Copyright © 2019 Angel Avila. All rights reserved.
//

import Foundation

extension String {
    func hourString() -> String {
        let f = DateFormatter()
        f.dateFormat = "HH:mm:ss"
        let timeDate = f.date(from: self)
        let time: String
        
        if let date = timeDate {
            f.dateFormat = "HH:mm"
            time = f.string(from: date)
        } else {
            time = "-"
        }
        
        return time
    }
    
    func dayString() -> String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "es_MX")
        let time: String
        
        let isoF = DateFormatter()
        isoF.timeZone = .current
        isoF.calendar = Calendar(identifier: .iso8601)
        isoF.locale = Locale(identifier: "en_US_POSIX")
        isoF.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        let formattedDate = isoF.date(from: self) ?? Date()
        f.dateFormat = "d MMMM"
        time = f.string(from: formattedDate).capitalized
        
        return time
    }
}

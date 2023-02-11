//
//  Double+TimeAgoSinceDate.swift
//  RedditGPT
//
//  Created by Chappy Asel on 2/10/23.
//

import Foundation

extension Double {
    func timeAgoSinceDate() -> String {
        let date = Date(timeIntervalSince1970: self)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
        formatter.maximumUnitCount = 1
        let interval = Date().timeIntervalSince(date)
        return formatter.string(from: interval) ?? ""
    }
}

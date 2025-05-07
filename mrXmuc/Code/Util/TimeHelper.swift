//
//  TimeHelper.swift
//  mrXmuc
//
//  Created by Konrad Weiß on 07.05.25.
//

import Foundation

func timeAsString(_ time: Int64?) -> String {
    if (time == nil) {
        return "--:--"
    }
    let date = Date(timeIntervalSince1970: TimeInterval(time!/1000))
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm,ss"

    return dateFormatter.string(from: date)
}

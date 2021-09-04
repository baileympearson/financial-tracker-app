//
//  Date+Day.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/2/21.
//

import Foundation

extension Date {
  var day: String {
    let df = DateFormatter()
    df.dateFormat = "d"
    return df.string(from: self)
  }
}

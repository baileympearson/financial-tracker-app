//
//  Date+Year.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/3/21.
//

import Foundation

extension Date {
  var year: String {
    let df = DateFormatter()
    df.dateFormat = "YYYY"
    return df.string(from: self)
  }
}

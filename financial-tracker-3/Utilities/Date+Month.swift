//
//  Date+Month.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/2/21.
//

import Foundation

extension Date {
  func month(abbreviated: Bool = false) -> String {
    let df = DateFormatter()
    df.dateFormat = abbreviated ? "MMM" : "MMMM"
    return df.string(from: self)
  }
}

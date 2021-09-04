//
//  Array+Sum.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/2/21.
//

import Foundation

extension Array where Element: Numeric {
  func sum() -> Element {
    reduce(.zero, +)
  }
}

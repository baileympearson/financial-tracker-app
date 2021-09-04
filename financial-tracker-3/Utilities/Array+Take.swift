//
//  Array+Take.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/2/21.
//

import Foundation

extension Array {
  func take(_ n: Int) -> Self {
    if n < 0 || n > count {
      return self
    }
    
    let index = index(startIndex, offsetBy: n)
    return Array(self[..<index])
  }
}

//
//  Set+Unique.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/2/21.
//

import Foundation

extension Array where Element : Hashable {
  func unique() -> Self {
    Array(Set(self))
  }
}

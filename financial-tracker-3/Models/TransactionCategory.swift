//
//  TransactionType.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/3/21.
//

import Foundation

struct TransactionCategory: Identifiable, Codable, Hashable {
  var id: UUID = UUID()
  var name: String
}

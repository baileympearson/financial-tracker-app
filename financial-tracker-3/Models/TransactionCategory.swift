//
//  TransactionType.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/3/21.
//

import Foundation
import FirebaseFirestoreSwift

struct TransactionCategory: Identifiable, Codable, Hashable {
  @DocumentID var id: String?
  var name: String
}

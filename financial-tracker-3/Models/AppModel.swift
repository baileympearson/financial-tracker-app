//
//  AppState.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 8/30/21.
//

import Foundation
import Combine

class AppModel : ObservableObject {
  @Published var transactions: [Transaction]
  @Published var categories: [TransactionCategory]
  
  init(transactions: [Transaction], categories: [TransactionCategory]) {
    self.transactions = transactions
    self.categories = categories
  }
}

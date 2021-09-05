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

extension AppModel {
  func update(transaction: Transaction) {
    guard let index = transactions.firstIndex(where: { $0.id == transaction.id }) else {
      return
    }
    
    transactions[index] = transaction
  }
}

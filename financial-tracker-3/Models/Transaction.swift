import Foundation
import FirebaseFirestoreSwift

struct Transaction: Identifiable, Codable {
  @DocumentID var id: String?
  
  var date: Date
  var amount: Double
  var description: String
  var category: TransactionCategory
  var type: TransactionType
  var notes: String? = nil
}

extension Transaction {
  static var empty : Transaction {
    return .init(date: Date(), amount: 0.0, description: "", category: TransactionCategory(name: ""), type: .expense)
  }
}

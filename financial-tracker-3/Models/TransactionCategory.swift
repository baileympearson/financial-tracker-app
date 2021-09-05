import Foundation
import FirebaseFirestoreSwift

struct TransactionCategory: Identifiable, Codable, Hashable {
  @DocumentID var id: String?
  var name: String
}

import Combine
import Firebase

class TransactionService : ObservableObject {
  @Published var transactions: [Transaction] = []
  private var db = Firestore.firestore()
  
  private static let COLLECTION_KEY = "transactions"
  
  func fetchTransactions() {
    let collection = db.collection(TransactionService.COLLECTION_KEY)
    
    collection.addSnapshotListener { [weak self] (snapshot, error) in
      guard let documents = snapshot?.documents else {
        print("No categories")
        return
      }
      
      let results = documents.compactMap { querySnapshot in
        return try? querySnapshot.data(as: Transaction.self)
      }
      
      print(results)
      self?.transactions = results
    }
  }
}

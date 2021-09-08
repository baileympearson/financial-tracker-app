import Combine
import Firebase

class TransactionService : ObservableObject {
  @Published var transactions: [Transaction] = []
  private var db = Firestore.firestore()
  
  private static let COLLECTION_KEY = "transactions"
  
  func fetchTransactions() {
    let collection = db.collection(TransactionService.COLLECTION_KEY)
    
    collection
      .order(by: "date", descending: true)
      .addSnapshotListener { [weak self] (snapshot, error) in
      guard let documents = snapshot?.documents else {
        // TODO: handle error properly
        print("No transactions")
        return
      }
      
      let results = documents.compactMap { querySnapshot in
        return try? querySnapshot.data(as: Transaction.self)
      }
      
      self?.transactions = results
    }
  }
  
  func add(transaction: Transaction) {
    let collection = db.collection(TransactionService.COLLECTION_KEY)
    do {
      let _ = try collection.addDocument(from: transaction)
    } catch {
      // TODO: handle error
      print("error error")
    }
  }
  
  func update(transaction: Transaction) {
    guard let documentId = transaction.id else { return }
    
    let document = db.collection(TransactionService.COLLECTION_KEY).document(documentId)
    do {
      try document.setData(from: transaction)
    } catch {
      // TODO: handle error
      print("error error")
    }
  }
  
  func delete(transaction: Transaction) {
    guard let documentId = transaction.id else { return }
    
    let document = db.collection(TransactionService.COLLECTION_KEY).document(documentId)
    document.delete()
  }
}

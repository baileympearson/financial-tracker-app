import Combine
import Firebase

class TransactionService : ObservableObject {
  @Published var transactions: [Transaction] = []
  private var db = Firestore.firestore()
  private var collection: CollectionReference {
    db.collection("transactions")
  }
    
  func fetchTransactions() {
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
    do {
      let _ = try collection.addDocument(from: transaction)
    } catch {
      // TODO: handle error
      print("error error")
    }
  }
  
  func update(transaction: Transaction) {
    guard let documentId = transaction.id else { return }
    
    let document = collection.document(documentId)
    do {
      try document.setData(from: transaction)
    } catch {
      // TODO: handle error
      print("error error")
    }
  }
  
  func delete(transaction: Transaction) {
    guard let documentId = transaction.id else { return }
    
    let document = collection.document(documentId)
    document.delete()
  }
}

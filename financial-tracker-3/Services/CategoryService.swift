import Combine
import Firebase

class CategoryService : ObservableObject {
  @Published var categories: [TransactionCategory] = []
  private var db = Firestore.firestore()
  private var collection: CollectionReference {
    db.collection("categories")
  }
    
  func loadCategories() {
    collection.addSnapshotListener { [weak self] (snapshot, error) in
      guard let documents = snapshot?.documents else {
        print("No categories")
        return
      }
      
      let results = documents.compactMap { querySnapshot in
        return try? querySnapshot.data(as: TransactionCategory.self)
      }
      
      self?.categories = results
    }
  }
  
  func add(_ category: TransactionCategory) throws {
    let _ = try collection.addDocument(from: category)
  }
  
  func update(category: TransactionCategory) {
    guard let documentId = category.id else { return }
    
    let document = collection.document(documentId)
    do {
      try document.setData(from: category)
    } catch {
      // TODO: handle error
      print("error error")
    }
  }
  
  func delete(_ category: TransactionCategory) throws {
    guard let documentId = category.id else { return }
    
    let document = collection.document(documentId)
    document.delete()
  }
}

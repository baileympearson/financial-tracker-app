import Combine
import Firebase

class CategoryService : ObservableObject {
  @Published var categories: [TransactionCategory] = []
  private var db = Firestore.firestore()
  
  private static let COLLECTION_KEY = "categories"
  
  func loadCategories() {
    let collection = db.collection(CategoryService.COLLECTION_KEY)
    
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
  
  func addCategory(_ category: TransactionCategory) throws {
    let collection = db.collection(CategoryService.COLLECTION_KEY)
    
    let _ = try collection.addDocument(from: category)
  }
}

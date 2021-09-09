import SwiftUI
import Combine
import Firebase
import Resolver

@main
struct financial_tracker_3App: App {
  init() {
    configureFirebase()
    let transactionService: TransactionService = Resolver.resolve()
    let categoryService: CategoryService = Resolver.resolve()
    transactionService.fetchTransactions()
    categoryService.loadCategories()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

import SwiftUI
import Combine
import Firebase

@main
struct financial_tracker_3App: App {
  @ObservedObject var transactionService: TransactionService
  @ObservedObject var categoryService: CategoryService

  init() {
    configureFirebase()
    transactionService = TransactionService()
    categoryService = CategoryService()
    transactionService.fetchTransactions()
    categoryService.get()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(transactionService)
        .environmentObject(categoryService)
    }
  }
}

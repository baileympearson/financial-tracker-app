import SwiftUI
import Combine
import Firebase

@main
struct financial_tracker_3App: App {
  @State var appModel = AppModel.mockModel
  @ObservedObject var transactionService: TransactionService
  @ObservedObject var categoryService: CategoryService

  init() {
    configureFirebase()
    transactionService = TransactionService()
    categoryService = CategoryService()
    transactionService.fetchTransactions()
    categoryService.loadCategories()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(appModel)
        .environmentObject(transactionService)
        .environmentObject(categoryService)
    }
  }
}

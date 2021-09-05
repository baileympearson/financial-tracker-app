import Foundation

#if DEBUG

extension AppModel {
  static var mockModel: AppModel {
    AppModel(
      transactions: mockTransactions,
      categories: mockCategories
    )
  }
}

#endif

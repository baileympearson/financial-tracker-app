//
//  MockAppModel.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/3/21.
//

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

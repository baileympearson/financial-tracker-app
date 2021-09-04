//
//  CategoryList.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/4/21.
//

import SwiftUI

struct SpendingCategoryTable: View {
  let spendingByCategory: [(key: String, total: Double)]
  
  var body: some View {
    if spendingByCategory.isEmpty {
      Text("You haven't spent anything this month!")
    } else {
      ForEach(spendingByCategory, id: \.key.self, content: SpendingCategoryListItem.init)
    }
  }
}


struct CategoryList_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SpendingCategoryTable(
        spendingByCategory: mockTransactions.totalSpendingByCategory)
        .navigationTitle(Text("Categories"))
    }
  }
}

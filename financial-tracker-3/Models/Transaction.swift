//
//  Transaction.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 8/28/21.
//

import Foundation
import FirebaseFirestoreSwift

enum TransactionType: String, Codable {
  case income, expense
}

struct Transaction: Identifiable, Codable {
  @DocumentID var id: String?
  
  var date: Date
  var amount: Double
  var description: String
  var category: TransactionCategory
  var type: TransactionType
  var notes: String? = nil
}

extension Array where Element == Transaction {
  var groupedByCategory: [String: [Transaction]] {
    Dictionary.init(grouping: filter { $0.type == .expense }, by: { $0.category.name })
  }
  
  var totalSpendingByCategory: [(key: String, total: Double)] {
    let spendingByCategory = groupedByCategory
    var ret: [(key: String, total: Double)] = []
    for (key, value) in spendingByCategory {
      let totalInCategory = value.map(\.amount).sum()
      ret.append((key, totalInCategory))
    }
    return ret.sorted(by: { $1.total < $0.total })
  }
}

fileprivate extension Date {
  var uniqueMonthString : String {
    let df = DateFormatter()
    df.dateFormat = "yyyy MMMM"
    return df.string(from: self)
  }
}

extension Array where Element == Transaction {
  var groupedByMonth: [String: [Transaction]] {
    Dictionary.init(grouping: self, by: { $0.date.uniqueMonthString })
  }
  
  var transactionsInCurrentMonth: [Transaction] {
    let currentMonth = Date().uniqueMonthString
    return groupedByMonth[currentMonth] ?? []
  }
}

extension Array where Element == Transaction {
  var uniqueMonths: [(year: String, months: [String])] {
    let transactionKeys = groupedByMonth.keys
      .map{ $0 as String }
    
    let yearsAndMonths = transactionKeys.map{ $0.components(separatedBy: " ") }
      .compactMap {
        $0.count >= 2 ? (year: $0[0], month: $0[1]) : nil
      }
        
    let uniqueYears = yearsAndMonths
      .map(\.year)
      .unique()
      .sorted(by:){ $0 > $1 }
    
    return uniqueYears.map { year in
      (year: year,
       months: yearsAndMonths
        .filter { $0.year == year }
        .map(\.month)
      )
    }
  }
}

extension Transaction {
  static var empty : Transaction {
    return .init(date: Date(), amount: 0.0, description: "", category: TransactionCategory(name: ""), type: .expense)
  }
}

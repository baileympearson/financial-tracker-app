import Foundation

extension Date {
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

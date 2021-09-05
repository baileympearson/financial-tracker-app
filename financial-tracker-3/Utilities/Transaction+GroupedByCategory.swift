import Foundation

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

import Foundation

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

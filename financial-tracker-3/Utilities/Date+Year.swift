import Foundation

extension Date {
  var year: String {
    let df = DateFormatter()
    df.dateFormat = "YYYY"
    return df.string(from: self)
  }
}

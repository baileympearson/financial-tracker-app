import Foundation

extension Date {
  var day: String {
    let df = DateFormatter()
    df.dateFormat = "d"
    return df.string(from: self)
  }
}

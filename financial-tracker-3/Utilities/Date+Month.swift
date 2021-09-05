import Foundation

extension Date {
  func month(abbreviated: Bool = false) -> String {
    let df = DateFormatter()
    df.dateFormat = abbreviated ? "MMM" : "MMMM"
    return df.string(from: self)
  }
}

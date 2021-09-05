import Foundation

extension Array where Element: Numeric {
  func sum() -> Element {
    reduce(.zero, +)
  }
}

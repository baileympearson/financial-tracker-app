import Foundation

extension Array where Element : Hashable {
  func unique() -> Self {
    Array(Set(self))
  }
}

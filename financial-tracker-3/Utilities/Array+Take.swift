import Foundation

extension Array {
  func take(_ n: Int) -> Self {
    if n < 0 || n > count {
      return self
    }
    
    let index = index(startIndex, offsetBy: n)
    return Array(self[..<index])
  }
}

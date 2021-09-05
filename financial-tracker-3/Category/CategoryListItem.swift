import SwiftUI

struct SpendingCategoryListItem: View {
  let key: String
  let total: Double
  
  var body: some View {
    HStack {
      Text("\(key.capitalized)")
        .font(.callout)
      Spacer()
      Text("$\(total, specifier: "%.2f")")
        .foregroundColor(.red)
    }
  }
}
struct CategoryListItem_Previews: PreviewProvider {
    static var previews: some View {
      SpendingCategoryListItem(
        key: "Car",
        total: 32.9
      )
      .previewLayout(.sizeThatFits)
    }
}

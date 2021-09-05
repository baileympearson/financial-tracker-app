import SwiftUI

struct CategoryNameField: View {
  @Binding var name: String
  
  var body: some View {
    Group {
      Section(header: Text("Category Name")) {
        TextField("Name", text: $name)
      }
    }
  }
}

import SwiftUI

fileprivate struct CategoryNameField: View {
  @Binding var name: String
  
  var body: some View {
    Group {
      Section(header: Text("Category Name")) {
        TextField("Name", text: $name)
      }
    }
  }
}

struct FormWrapper : View {
  @State var transactionCategory: TransactionCategory = TransactionCategory(name: "")
  
  let onSave: (TransactionCategory) -> ()
  
  var body: some View {
    NavigationView {
      Form {
        CategoryNameField(name: $transactionCategory.name)
        Button("Save") {
          onSave(transactionCategory)
        }
      }.navigationTitle("Add Category")
    }
  }
}

extension FormWrapper {
  enum FormMode {
    case create, update
  }
}

//struct AddCategoryForm_Previews: PreviewProvider {
//  static var previews: some View {
////    FormWrapper(mode: .update)
//  }
//}

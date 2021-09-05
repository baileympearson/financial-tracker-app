import SwiftUI

fileprivate enum ActiveAlert {
  case error, success
}

struct AddCategory: View {
  @EnvironmentObject var categoryService: CategoryService
  @State var category = TransactionCategory(name: "")
  @Binding var isFormShowing: Bool
  @State private var isAlertShowing = false
  @State private var activeAlert = ActiveAlert.success
  
  var successAlert: Alert {
    Alert(
      title:Text("Success"),
      message: Text("We've successfully saved your new category."),
      dismissButton: .default(Text("OK"), action: {
        isAlertShowing.toggle()
        isFormShowing.toggle()
      })
    )
  }
  
  var failureAlert: Alert {
    Alert(title: Text("Something went wrong"),
          message: Text("We're unable to add your new category right now.  Please try again later."),
          dismissButton: .default(Text("OK"), action: {
            isAlertShowing.toggle()
            isFormShowing.toggle()
          }))
  }
  
  var body: some View {
    NavigationView {
      Form {
        CategoryNameField(name: $category.name)
        Button("Save", action: addCategory)
      }
      .navigationTitle("Add Category")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: {
            isFormShowing.toggle()
          }, label: {
            Text("Cancel")
          })
        }
      }
      .alert(isPresented: $isAlertShowing, content: {
              switch activeAlert{
              case .error:
                return failureAlert
              case .success:
                return successAlert
              }})
    }
  }
  
  func addCategory() {
    do {
      try categoryService.addCategory(category)
      activeAlert = .success
    } catch {
      activeAlert = .error
    }
    isAlertShowing.toggle()
  }
}

struct AddCategory_Previews: PreviewProvider {
  static var previews: some View {
    AddCategory(
      isFormShowing: .constant(true)
    )
  }
}

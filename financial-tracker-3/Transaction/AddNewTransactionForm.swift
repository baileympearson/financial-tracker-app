import SwiftUI

struct AddNewTransactionForm: View {
  @EnvironmentObject var transactionService: TransactionService
  @State private var formViewModel = TransactionFormViewModel(from: .empty)
  @State private var transaction: Transaction = .empty
  @State private var isSuccessAlertShowing = false
  @Binding var isEditFormShowing: Bool
  
  var successAlert: Alert {
    let dismissButton = Alert.Button.default(Text("OK"), action: {
      isSuccessAlertShowing.toggle()
      isEditFormShowing.toggle()
    })
    return Alert(
      title: Text("Success!"),
      message: Text("We've recorded your new transaction."),
      dismissButton: dismissButton)
  }
  
  var body: some View {
    TransactionForm()
      .environmentObject(formViewModel.onSave(onSave: saveButtonClicked))
      .alert(isPresented: $isSuccessAlertShowing) {
        successAlert
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: {
            isEditFormShowing.toggle()
          }, label: {
            Text("Cancel")
          })
        }
      }
  }
  
  func saveButtonClicked(_ transaction: Transaction) {
    let transaction = formViewModel.transaction()
    transactionService.add(transaction: transaction)
    isSuccessAlertShowing = true
  }
}

struct AddNewTransactionForm_Previews: PreviewProvider {
  static var previews: some View {
    AddNewTransactionForm(isEditFormShowing: .constant(true))
      .environmentObject(AppModel.mockModel)
  }
}

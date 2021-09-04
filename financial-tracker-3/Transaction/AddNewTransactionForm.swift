//
//  AddNewTransactionForm.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 8/29/21.
//

import SwiftUI

struct AddNewTransactionForm: View {
  @Binding var transactions: [Transaction]
  @State private var transaction: Transaction = .empty
  @State private var isSuccessAlertShowing = false
  @Binding var isEditFormShowing: Bool
  
  var successAlert: Alert {
    Alert(
      title: Text("Success!"),
      message: Text("We've recorded your new transaction."),
      dismissButton: .default(Text("OK"), action: {
        isSuccessAlertShowing.toggle()
        isEditFormShowing.toggle()
      }))
  }
  
  var body: some View {
    TransactionForm(transaction: $transaction, onSave: saveButtonClicked)
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
    transactions.insert(transaction, at: 0)
    self.transaction = .empty
    isSuccessAlertShowing = true
  }
}

struct AddNewTransactionForm_Previews: PreviewProvider {
  static var previews: some View {
    AddNewTransactionForm(transactions: .constant(mockTransactions), isEditFormShowing: .constant(true))
  }
}

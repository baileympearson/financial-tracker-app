//
//  EditTransactionForm.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 8/30/21.
//

import SwiftUI

struct EditTransactionForm: View {
  @Binding var transaction: Transaction
  @Binding var isViewShowing: Bool
  
  var body: some View {
    TransactionForm()
  }
  
  func saveButtonClicked(_ transaction: Transaction) {
    self.transaction.amount = transaction.amount
    self.transaction.date = transaction.date
    self.transaction.type = transaction.type
    self.transaction.category = transaction.category
    self.transaction.description = transaction.description
    
    isViewShowing = false
  }
}

struct EditTransactionForm_Previews: PreviewProvider {
    static var previews: some View {
      EmptyView()
    }
}

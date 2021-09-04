//
//  TransactionDetailsList.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 8/30/21.
//

import SwiftUI

struct TransactionDetailsList: View {
  var month: String
  @Binding var transactions: [Transaction]
  @State private var editMode: EditMode = .inactive
  @State private var isEditingTransaction = false
  @State private var editingTransaction: Transaction? = nil
  
  @State private var selectedIndex: Int? = nil
    
  var body: some View {
    List {
      ForEach(transactions.transactionsInCurrentMonth) { transaction in
          TransactionListItem(transaction: transaction)
            .onTapGesture {
              selectedIndex = transactions.firstIndex(where: { $0.id == transaction.id})
              isEditingTransaction = true
            }
      }
      .onDelete(perform: deleteTransaction)
    }
    .listStyle(InsetGroupedListStyle())
    .navigationTitle("\(month.capitalized) Transactions")
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing,
                  content: EditButton.init)
    }
    .sheet(isPresented: $isEditingTransaction, onDismiss: {
      selectedIndex = nil
    }, content: {
      EditTransactionForm(transaction: $transactions[selectedIndex!], isViewShowing: $isEditingTransaction)
    })
    .environment(\.editMode, $editMode)
  }
  
  func deleteTransaction(index: IndexSet) {
    transactions.remove(atOffsets: index)
  }
}

struct TransactionDetailsList_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      
      TransactionDetailsList(month: "august", transactions: .constant(mockTransactions))
    }
  }
}

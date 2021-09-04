//
//  TransactionDetailsList.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 8/30/21.
//

import SwiftUI

struct TransactionDetailsList: View {
  var month: String
  @EnvironmentObject var appModel: AppModel
  @State private var editMode: EditMode = .inactive
  @State private var isEditingTransaction = false
  @State private var editingTransaction: Transaction? = nil
    
  @State private var formViewModel = TransactionFormViewModel(from: .empty)
    
  var body: some View {
    List {
      ForEach(appModel.transactions.transactionsInCurrentMonth) { transaction in
          TransactionListItem(transaction: transaction)
            .onTapGesture {
              formViewModel.reset(to: transaction)
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
    .sheet(isPresented: $isEditingTransaction, content: {
      NavigationView {
        TransactionForm()
          .environmentObject(formViewModel.onSave() { transaction in
            appModel.update(transaction: transaction)
            isEditingTransaction = false
          })
          .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
              Button(action: {
                isEditingTransaction = false
                formViewModel.reset(to: .empty)
              }, label: {
                Text("Cancel")
              })
            }
          }
          .navigationTitle("Edit Transaction")
      }
    })
    .environment(\.editMode, $editMode)
  }
  
  func deleteTransaction(index: IndexSet) {
    appModel.transactions.remove(atOffsets: index)
  }
}

struct TransactionDetailsList_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      
      TransactionDetailsList(month: "august")
        .environmentObject(AppModel.mockModel)
    }
  }
}

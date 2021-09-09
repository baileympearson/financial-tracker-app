import SwiftUI
import Resolver

struct TransactionDetailsList: View {
  var month: String
  @ObservedObject var transactionService: TransactionService = Resolver.resolve()
  @State private var editMode: EditMode = .inactive
  @State private var isEditingTransaction = false
  @State private var editingTransaction: Transaction? = nil
    
  @State private var formViewModel = TransactionFormViewModel(from: .empty)
    
  var body: some View {
    List {
      ForEach(transactionService.transactions.transactionsInCurrentMonth) { transaction in
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
            transactionService.update(transaction: transaction)
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
    let transactions = index.map({ transactionService.transactions[$0] })
    transactions.forEach {
      transactionService.delete(transaction: $0)
    }
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

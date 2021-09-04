//
//  TransactionForm.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 8/29/21.
//

import SwiftUI
import Combine

class TransactionFormViewModel: ObservableObject {
  @Published var amount = ""
  @Published var description = ""
  @Published var category = TransactionCategory(name: "")
  @Published var date = Date()
  @Published var type = TransactionType.expense
  
  func transaction() -> Transaction {
    Transaction(date: date,
                amount: Double(amount) ?? 0.0,
                description: description,
                category: category,
                type: type)
  }
}

struct TransactionForm: View {
  @EnvironmentObject var appModel: AppModel
  @Binding var transaction: Transaction
  var onSave: (Transaction) -> Void
  
  @ObservedObject var state = TransactionFormViewModel()
  
  init(transaction: Binding<Transaction>, onSave: @escaping (Transaction) -> Void) {
    self._transaction = transaction
    self.onSave = onSave
    state.amount = self.transaction.amount == 0 ? "" : "\(self.transaction.amount)"
    state.date = self.transaction.date
    state.description = self.transaction.description
    state.category = self.transaction.category
    state.type = self.transaction.type
  }
  
  var body: some View {
    Form {
      Section {
        VStack(alignment: .leading) {
          TextField("Description", text: $state.description)
//                    Text("Description is required.")
//                      .foregroundColor(.red)
//                      .font(.caption)
        }
        TextField("Amount", text: $state.amount)
          .keyboardType(.decimalPad)
          .onReceive(Just(state.amount)) { newValue in
            let filtered = newValue.filter { "0123456789.".contains($0) }
            if filtered != newValue {
              state.amount = filtered
            }
          }
        Picker("Type", selection: $state.type) {
          Text("Expense").tag(TransactionType.expense)
          Text("Income").tag(TransactionType.income)
        }.pickerStyle(SegmentedPickerStyle())
        
        if transaction.type == .expense {
          Picker("Category", selection: $state.category, content: {
            ForEach(appModel.categories) { category in
              Text(category.name).tag(category)
            }
          })
        }
      }
      
      Section (header: Text("Date of Transaction")) {
        DatePicker("Date", selection: $state.date, in: ...Date(), displayedComponents: [.date])
      }
      
      Button(action: {
        onSave(state.transaction())
      }, label: {
        Text("Save Transaction")
      }).disabled(false)
    }
  }
}

struct TransactionForm_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      TransactionForm(transaction: .constant(mockTransactions[0]), onSave: {_ in})
        .navigationTitle("Record Transaction")
        .environmentObject(AppModel.mockModel)
    }
  }
}

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
  
  private var id: UUID? = nil
  
  private var onSave: ((Transaction) -> Void)?
  
  func transaction() -> Transaction {
    if let id = id {
      return Transaction(id: id,
                         date: date,
                         amount: Double(amount) ?? 0.0,
                         description: description,
                         category: category,
                         type: type)
    }
    
    return Transaction(date: date,
                       amount: Double(amount) ?? 0.0,
                       description: description,
                       category: category,
                       type: type)
  }
  
  func onSave(onSave: @escaping (Transaction) -> Void) -> Self {
    self.onSave = onSave
    return self
  }
  
  convenience init(from transaction: Transaction) {
    self.init()
    self.reset(to: transaction)
  }
  
  func save() {
    onSave?(transaction())
  }
  
  func clear() {
    self.reset(to: .empty)
  }
  
  func reset(to transaction: Transaction) {
    self.amount = transaction.amount == 0 ? "" : String(transaction.amount)
    self.description = transaction.description
    self.category = transaction.category
    self.date = transaction.date
    self.type = transaction.type
    self.id = transaction.id
  }
}

struct TransactionForm: View {
  @EnvironmentObject var appModel: AppModel
  @EnvironmentObject var viewModel: TransactionFormViewModel
  
  var body: some View {
    Form {
      Section {
        VStack(alignment: .leading) {
          TextField("Description", text: $viewModel.description)
          //                    Text("Description is required.")
          //                      .foregroundColor(.red)
          //                      .font(.caption)
        }
        TextField("Amount", text: $viewModel.amount)
          .keyboardType(.decimalPad)
          .onReceive(Just(viewModel.amount)) { newValue in
            let filtered = newValue.filter { "0123456789.".contains($0) }
            if filtered != newValue {
              viewModel.amount = filtered
            }
          }
        Picker("Type", selection: $viewModel.type) {
          Text("Expense").tag(TransactionType.expense)
          Text("Income").tag(TransactionType.income)
        }.pickerStyle(SegmentedPickerStyle())
        
        Picker("Category", selection: $viewModel.category, content: {
          ForEach(appModel.categories) { category in
            Text(category.name).tag(category)
          }
        })
      }
      
      Section (header: Text("Date of Transaction")) {
        DatePicker("Date", selection: $viewModel.date, in: ...Date(), displayedComponents: [.date])
      }
      
      Button(action: {
        viewModel.save()
      }, label: {
        Text("Save Transaction")
      }).disabled(false)
    }
  }
}

struct TransactionForm_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      TransactionForm()
        .navigationTitle("Record Transaction")
        .environmentObject(AppModel.mockModel)
    }
  }
}

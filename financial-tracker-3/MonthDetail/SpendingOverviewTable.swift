import SwiftUI

struct SpendingOverviewTable {
  let transactions: [Transaction]
  
  var totalIncome : Double {
    transactions
      .filter{ $0.type == .income }
      .map(\.amount)
      .sum()
  }
  
  var totalExpense : Double {
    transactions
      .filter{ $0.type == .expense }
      .map(\.amount)
      .sum()
  }
  
  var netWorthChange: Double {
    totalIncome - totalExpense
  }
  
  var didNetWorthIncrease: Bool {
    netWorthChange >= 0
  }
  
  var netChangeString: String {
    let rawAmount = abs(netWorthChange)
    let amountString = String(format: "%.2f", rawAmount)
    return didNetWorthIncrease ? "$\(amountString)" : "-$\(amountString)"
  }
}

extension SpendingOverviewTable: View {
  var body: some View {
    VStack(alignment: .center) {
      HStack(alignment: .center) {
        Text("Income")
        Spacer()
        Text("$\(totalIncome, specifier: "%.2f")")
          .foregroundColor(.green)
      }.padding(.top, 4)
      Divider()
      HStack {
        Text("Expenses")
        Spacer()
        Text("-$\(totalExpense, specifier: "%.2f")")
          .foregroundColor(.red)
      }
      Divider()
      HStack {
        Text("Net Change")
        Spacer()
        Text(netChangeString)
          .foregroundColor(didNetWorthIncrease ? .green : .red)
      }.padding(.bottom, 4)
    }
  }
}

struct SpendingOverviewTable_Previews: PreviewProvider {
  static var previews: some View {
    
      SpendingOverviewTable(transactions: mockTransactions)
        .previewLayout(.sizeThatFits)
  }
}

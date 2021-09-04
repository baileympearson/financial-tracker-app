//
//  TransactionListItem.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 8/28/21.
//

import SwiftUI

struct TransactionListItem: View {
  let transaction: Transaction
  
  var descriptionText: String {
    let amount = String(format: "%.2f", transaction.amount)
    return transaction.type == .income
      ? "$\(amount)"
      : "-$\(amount)"
  }
  
  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      VStack {
        Text("\(transaction.date.day)")
          .font(.body)
        Text("\(transaction.date.month(abbreviated: true))")
          .font(.caption)
      }.padding(4)
      
      VStack(alignment: .leading) {
        Text(transaction.description)
          .lineLimit(1)
          .truncationMode(.tail)
          .font(.body)
        
        Text(transaction.category.name)
          .font(.caption)
          .lineLimit(1)
          .truncationMode(.tail)
      }
      
      Spacer()
      
      Text(descriptionText)
        .font(.body)
        .foregroundColor(transaction.type == .income ? .green : .red)
    }
  }
}

struct TransactionListItem_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(mockTransactions.take(5)) {
      TransactionListItem(transaction:$0)
        .previewLayout(.sizeThatFits)
    }
  }
}

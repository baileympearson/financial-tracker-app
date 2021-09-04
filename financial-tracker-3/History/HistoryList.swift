//
//  HistoryList.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/1/21.
//

import SwiftUI

let MAX_TRANSACTIONS = 3

struct HistoryList: View {
  @Binding var transactions: [Transaction]
  
  var body: some View {
    List {
      ForEach(transactions.uniqueMonths, id: \.year ) { (year, months) in
        Section(header: Text("\(year)")) {
          ForEach(months, id: \.self) { month in
            NavigationLink(
              destination: MonthDetail(transactions: $transactions, year: year, month: month),
              label: {
                Text(month).font(.callout)
                
              })
          }
        }
      }
    }
    .listStyle(GroupedListStyle())
  }
}

struct HistoryList_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      HistoryList(transactions: .constant(mockTransactions))
        .navigationTitle("Past Months")
    }
  }
}

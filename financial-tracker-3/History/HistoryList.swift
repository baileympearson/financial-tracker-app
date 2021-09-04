//
//  HistoryList.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/1/21.
//

import SwiftUI

let MAX_TRANSACTIONS = 3

struct HistoryList: View {
  @EnvironmentObject var appModel: AppModel
  
  var body: some View {
    List {
      ForEach(appModel.transactions.uniqueMonths, id: \.year ) { (year, months) in
        Section(header: Text("\(year)")) {
          ForEach(months, id: \.self) { month in
            NavigationLink(
              destination: MonthDetail(year: year, month: month),
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
      HistoryList()
        .navigationTitle("Past Months")
        .environmentObject(AppModel.mockModel)
    }
  }
}

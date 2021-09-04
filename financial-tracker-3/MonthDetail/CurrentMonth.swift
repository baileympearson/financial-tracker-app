//
//  CurrentMonthView.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/3/21.
//

import SwiftUI

struct CurrentMonthView: View {
  @EnvironmentObject var appModel: AppModel
  @State var isAddingTransaction = false
  @State var isSettingsPageActive = false
  
  var body: some View {
    NavigationView {
      MonthDetail(transactions: $appModel.transactions, year: Date().year, month: Date().month())
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
              isSettingsPageActive.toggle()
            }, label: {
              Image(systemName: "gearshape")
            })
          }
          ToolbarItemGroup(placement: .navigationBarTrailing){
            Button(action: {
              isAddingTransaction.toggle()
            }, label: {
              Image(systemName: "plus")
            })
          }
        }
        .fullScreenCover(isPresented: $isAddingTransaction) {
          NavigationView {
            AddNewTransactionForm(
              transactions: $appModel.transactions,
              isEditFormShowing: $isAddingTransaction)
              .navigationTitle("Record Transaction")
          }
        }
        .fullScreenCover(isPresented: $isSettingsPageActive) {
          NavigationView {
            SettingsView()
              .navigationTitle("Settings")
          }
        }
    }
    
  }
}

struct CurrentMonthView_Previews: PreviewProvider {
  static var previews: some View {
    CurrentMonthView()
      .environmentObject(AppModel.mockModel)
  }
}

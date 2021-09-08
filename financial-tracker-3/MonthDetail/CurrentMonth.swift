import SwiftUI

struct CurrentMonthView: View {
  @State var isAddingTransaction = false
  @State var isSettingsPageActive = false
  
  var body: some View {
    NavigationView {
      MonthDetail(year: Date().year, month: Date().month())
        .toolbar {
          SettingsToolBarItem
          AddTransactionToolbarItem
        }
        .sheet(isPresented: $isAddingTransaction) {
          AddTransactionForm
        }
        .fullScreenCover(isPresented: $isSettingsPageActive) {
          SettingsSheetView
        }
    }
  }
}

extension CurrentMonthView {
  var SettingsToolBarItem: ToolbarItem<Void, Button<Image>> {
    ToolbarItem(placement: .navigationBarLeading) {
      Button(action: {
        isSettingsPageActive.toggle()
      }, label: {
        Image(systemName: "gearshape")
      })
    }
  }
  
  var AddTransactionToolbarItem: ToolbarItem<Void, Button<Image>> {
    ToolbarItem(placement: .navigationBarTrailing){
      Button(action: {
        isAddingTransaction.toggle()
      }, label: {
        Image(systemName: "plus")
      })
    }
  }
  
  var AddTransactionForm: some View {
    NavigationView {
      AddNewTransactionForm(isEditFormShowing: $isAddingTransaction)
        .navigationTitle("Record Transaction")
    }
  }
  
  var SettingsSheetView: some View {
    NavigationView {
      SettingsView()
        .navigationTitle("Settings")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              isSettingsPageActive.toggle()
            }, label: {
              Text("Done")
            })
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

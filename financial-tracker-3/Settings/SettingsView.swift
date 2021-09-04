//
//  SettingsView.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/3/21.
//

import SwiftUI

struct AddCategory: View {
  @Binding var categories: [TransactionCategory]
  @Binding var isFormShowing: Bool
  @State private var isSuccessAlertShowing = false
  
  var successAlert: Alert {
    Alert(
      title:Text("Success"),
      message: Text("We've successfully saved your new category."),
      dismissButton: .default(Text("OK"), action: {
        isSuccessAlertShowing.toggle()
        isFormShowing.toggle()
      })
    )
  }
  
  var body: some View {
    FormWrapper(onSave: { category in
      categories.append(category)
      isSuccessAlertShowing = true
    })
    .alert(isPresented: $isSuccessAlertShowing, content: { successAlert })
  }
}

struct CategoriesView : View {
  @EnvironmentObject var appModel: AppModel
  @State var isAddCategoryFormShowing = false
  
  var body: some View{
    List {
      ForEach(appModel.categories) {
        Text($0.name)
      }
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: {
          isAddCategoryFormShowing.toggle()
        }, label: {
          Image(systemName: "plus")
        })
      }
    }
    .fullScreenCover(
      isPresented: $isAddCategoryFormShowing,
      content: {
        AddCategory(
          categories: $appModel.categories,
          isFormShowing: $isAddCategoryFormShowing
        )})
    .navigationTitle("Manage Categories")
  }
}


struct SettingsView: View {
  var body: some View {
    List {
      Section {
        NavigationLink(
          destination: CategoriesView(),
          label: {
            Text("Manage Categories")
          })
      }
      
      Button(action: {
        
      }, label: {
        HStack {
          Spacer()
          Text("Sign Out")
            .foregroundColor(.red)
          Spacer()
        }
      })
    }.listStyle(InsetGroupedListStyle())
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SettingsView()
        .navigationTitle(Text("Settings"))
    }
  }
}

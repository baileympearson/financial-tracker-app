//
//  AddCategory.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/4/21.
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

struct AddCategory_Previews: PreviewProvider {
    static var previews: some View {
        AddCategory(
          categories: .constant(mockCategories),
          isFormShowing: .constant(true)
        )
    }
}

import SwiftUI

struct CategoriesTable : View {
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

struct CategoriesTable_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesTable()
    }
}

import SwiftUI
import Resolver

struct CategoriesTable : View {
  @ObservedObject var categoryService: CategoryService = Resolver.resolve()
  @State private var isAddCategoryFormShowing = false
  
  var body: some View{
    List {
      ForEach(categoryService.categories) {
        Text($0.name)
      }
    }
    .listStyle(InsetGroupedListStyle())
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: {
          isAddCategoryFormShowing.toggle()
        }, label: {
          Image(systemName: "plus")
        })
      }
    }
    .sheet(
      isPresented: $isAddCategoryFormShowing,
      content: {
        AddCategory(
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

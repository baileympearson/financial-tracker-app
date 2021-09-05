import SwiftUI


struct SettingsView: View {
  var body: some View {
    List {
      Section {
        NavigationLink(
          destination: CategoriesTable(),
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
        .environmentObject(AppModel.mockModel)
    }
  }
}

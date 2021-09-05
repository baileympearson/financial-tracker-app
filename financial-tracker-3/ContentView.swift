import SwiftUI

struct ContentView {
  @EnvironmentObject var appModel: AppModel
}

extension ContentView: View {
  var body: some View {
    TabView {
      CurrentMonthView()
        .tabItem {
          Image("graph-icon")
            .renderingMode(.template)
          Text("Monthly Overview")
        }
      NavigationView {
        HistoryList()
          .navigationTitle("Past Months")
      }.tabItem {
        Image(systemName: "list.dash")
        Text("Past Months")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ContentView()
        .environmentObject(AppModel.mockModel)
    }
  }
}

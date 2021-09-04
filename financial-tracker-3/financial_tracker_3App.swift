//
//  financial_tracker_3App.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 8/28/21.
//

import SwiftUI
import Combine

@main
struct financial_tracker_3App: App {
  @State var appModel = AppModel.mockModel
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(appModel)
    }
  }
}

//
//  firebase.swift
//  financial-tracker-3
//
//  Created by Bailey Pearson on 9/4/21.
//

import Foundation
import Firebase

func configureFirebase() {
  FirebaseApp.configure()
  #if DEBUG
    let settings = Firestore.firestore().settings
    settings.host = "localhost:8080"
    settings.isPersistenceEnabled = false
    settings.isSSLEnabled = false
    Firestore.firestore().settings = settings
  #endif
}

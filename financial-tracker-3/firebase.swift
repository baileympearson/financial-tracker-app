import Firebase
import FirebaseFirestoreSwift

func configureFirebase() {
  FirebaseApp.configure()
  
  let settings = Firestore.firestore().settings
  settings.host = "localhost:8080"
  settings.isPersistenceEnabled = false
  settings.isSSLEnabled = false
  Firestore.firestore().settings = settings
}

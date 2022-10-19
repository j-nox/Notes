import CoreData
import SwiftUI

class AddNoteViewModel: ObservableObject {
  
  @Published var note: Note = Note(content: "")
  
  func createNote() {
    
    PersistenceManager.shared.createNote(receivedContent: note)
    
  }
  
}

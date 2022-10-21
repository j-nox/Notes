import CoreData
import SwiftUI

class EditNoteViewModel: ObservableObject {
  
  @Published var note: Note = Note(content: "")
  
  func updateNote() {
    do {
      try PersistenceManager.shared.updateNote(note: note)
    } catch {
      print("Error: \(error)")
    }
  }
  
  func deleteNote() {
    do {
      try PersistenceManager.shared.deleteNote(note: note)
    } catch {
      print("Error: \(error)")
    }
  }
  
}

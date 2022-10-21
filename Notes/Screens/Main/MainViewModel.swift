import CoreData
import SwiftUI

class MainViewModel: ObservableObject {
  
  @Published var notes: [Note] = []
  
  init() {
    if isItFirstRun() {
      createFirstNote()
    } else {
      getAllNotes()
    }
  }
  
  // MARK: - Methods
  
  func getAllNotes() {
    do {
      
      notes = []
      
      let notesFromCoreData: [NoteModelObject] = try PersistenceManager.shared.readAllNotes()
      
      for note in notesFromCoreData {
        self.notes.append(Note(id: note.id ?? UUID(), content: note.content))
      }
      
    } catch {
      print("Erorr words loading from Core Data")
    }
  }
  
  func createFirstNote() {
    
    let firstNote: Note = Note(id: UUID(), content: "First Note")
    
    PersistenceManager.shared.createNote(receivedContent: firstNote)
  }
  
  // MARK: - Helpers
  
  func isItFirstRun() -> Bool {
    
    let defaults = UserDefaults.standard
    
    if let _ = defaults.string(forKey: "firstRun") {
      return false
    } else {
      defaults.set("", forKey: "firstRun")
      return true
    }
  }
}

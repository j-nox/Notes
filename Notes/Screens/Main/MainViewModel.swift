import CoreData
import SwiftUI

/// ViewModel основного экрана
class MainViewModel: ObservableObject {
  
  
  // MARK: - Parameters
  
  /// Список слов для отображения
  @Published var notes: [Note]      = []
  
  // MARK: - Initializers
  
  init() {
    
    if isItFirstRun() {
      
      createFirstNote()
      
    } else {
      
      do {
        
        let notesFromCoreData: [NoteModelObject] = try PersistenceManager.shared.readAllNotes()
        
        for note in notesFromCoreData {
          if note.id != nil {
            self.notes.append(Note(id: note.id!, content: note.content))
          }
        }
      } catch {
        print("Erorr words loading from Core Data")
      }
      
    }
  }
  
  // MARK: - Methods
  
  func createFirstNote() {
    let firstNote: Note = Note(content: "First Note")
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

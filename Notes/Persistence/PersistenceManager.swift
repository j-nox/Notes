import CoreData

final class PersistenceManager {
  
  let container: NSPersistentContainer
  
  static let shared = PersistenceManager()
  
  private init() {
    
    container = NSPersistentContainer(name: "DataBase")
    
    container.loadPersistentStores { description, error in
      
      if let receivedError = error {
        fatalError("Error: \(receivedError.localizedDescription)")
      }
      
      print(description.url as Any)
    }
  }
  
  func readAllNotes() throws -> [NoteModelObject] {
    
    let request = NSFetchRequest<NoteModelObject>(entityName: "NoteModelObject")
    
    do {
      return try container.viewContext.fetch(request)
    } catch {
      throw DataBaseErrors.badFetchRequest
    }
  }
  
  func createNote(receivedContent: Note) {
    
    let newEntity = NoteModelObject(context: container.viewContext)
    
    newEntity.content = receivedContent.content
    
    do {
      try container.viewContext.save()
    } catch {
      print("Error: \(error)")
    }
  }
  
}

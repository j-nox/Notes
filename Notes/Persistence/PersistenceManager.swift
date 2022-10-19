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
    
    newEntity.id = UUID()
    newEntity.content = receivedContent.content
    
    do {
      try container.viewContext.save()
    } catch {
      print("Error: \(error)")
    }
  }
  
  func updateNote(note: Note) throws {
    
    let request = NSFetchRequest<NoteModelObject>(entityName: "NoteModelObject")
    
    let idPredicate = NSPredicate(format: "id == %@", note.id as CVarArg)
    request.predicate = idPredicate
    request.fetchLimit = 1
    
    do {
      let noteForUpdate: NoteModelObject? = try container.viewContext.fetch(request).first
      if noteForUpdate != nil {
        noteForUpdate?.content = note.content
        try container.viewContext.save()
      }
    } catch {
      throw DataBaseErrors.badFetchRequest
    }
    
  }
  
}

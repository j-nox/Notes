import CoreData
import Foundation

@objc(NoteModelObject) public class NoteModelObject: NSManagedObject, Identifiable {
  
  @NSManaged public var id: UUID?
  @NSManaged public var content: String
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteModelObject> {
    return NSFetchRequest<NoteModelObject>(entityName: "NoteModelObject")
  }
}

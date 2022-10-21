import SwiftUI

struct EditNoteScreen: View {
  
  @StateObject var viewModel: EditNoteViewModel = EditNoteViewModel()
  
  @State var note: Note
  
  @Binding var notes: [Note]
  
  var body: some View {
    VStack {
      TextField("Content of note", text: $note.content)
      
      Button {
    
        viewModel.note = note
        
        viewModel.updateNote()
      } label: {
        Text("Save")
      }
      
      Button {
    
        viewModel.note = note
        
        viewModel.deleteNote()
      } label: {
        Text("Delete")
      }

    }
  }
}

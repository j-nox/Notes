import SwiftUI

struct AddNoteScreen: View {
  
  @StateObject var viewModel: AddNoteViewModel = AddNoteViewModel()
  
  @State var content: String                   = ""
  
  @Binding var notes: [Note]
  
  var body: some View {
    VStack {
      TextField("Content of note", text: $content)
      
      Button {
      
        viewModel.note = Note(content: content)
        
        viewModel.createNote()
      } label: {
        Text("Create")
      }

    }
  }
}

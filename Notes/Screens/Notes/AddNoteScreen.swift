import SwiftUI

struct AddNoteScreen: View {
  
  @Environment(\.dismiss) var dismiss

  @StateObject var viewModel: AddNoteViewModel = AddNoteViewModel()
  
  @State var content: String                   = ""
  
  @Binding var notes: [Note]
  
  var body: some View {
    VStack {
      TextField("Content of note", text: $content)
      
      Button {
      
        viewModel.note = Note(content: content)
        
        viewModel.createNote()
        dismiss()
      } label: {
        Text("Create")
      }

    }
  }
}

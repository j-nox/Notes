import SwiftUI

struct AddNoteScreen: View {
  @State var content: String = ""
  @Binding var notes: [Note]
  
  var body: some View {
    
    VStack {
      
      TextField("Content of note", text: $content)
      
      Button {
        notes.append(Note(content: content))
      } label: {
        Text("Create")
      }

    }
  }
}

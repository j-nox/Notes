import SwiftUI

struct MainScreen: View {
  @State var createSheetStatus: Bool = false
  @State var editSheetStatus: Bool = false
  @State var notes: [Note] = [Note(content: "Note content"), Note(content: "Note two")]
  
  var body: some View {
    VStack {
      Button {
        createSheetStatus.toggle()
      } label: {
        Text("Create")
      }
      .padding()
      
      ScrollView {
        ForEach(notes) { note in
          NavigationLink {
            EditNoteScreen(note: note, notes: $notes)
          } label: {
            Text(note.content)
          }
        }
      }
    }
    
    .sheet(isPresented: $createSheetStatus) {
      AddNoteScreen(notes: $notes)
    }
  }
  
}

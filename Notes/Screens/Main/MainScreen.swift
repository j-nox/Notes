import SwiftUI

struct MainScreen: View {
  var notes: [Note] = [Note(content: "Note content"), Note(content: "Note two")]
  
  var body: some View {
    ScrollView {
      ForEach(notes) { note in
        Text(note.content)
      }
    }
  }
  
}

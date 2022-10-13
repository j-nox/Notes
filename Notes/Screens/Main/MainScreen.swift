import SwiftUI

struct MainScreen: View {
  @State var createSheetStatus: Bool = false
  
  var notes: [Note] = [Note(content: "Note content"), Note(content: "Note two")]
  
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
          Text(note.content)
        }
      }
    }
    
    .sheet(isPresented: $createSheetStatus) {
      Text("Stub")
    }
  }
  
}

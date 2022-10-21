import SwiftUI

struct MainScreen: View {
  @StateObject var viewModel: MainViewModel = MainViewModel()
  @State var createSheetStatus: Bool = false
  @State var editSheetStatus: Bool = false
  
  var body: some View {
    VStack {
      Button {
        createSheetStatus.toggle()
      } label: {
        Text("Create")
      }
      .padding()
      
      ScrollView {
        ForEach(viewModel.notes) { note in
          NavigationLink {
            EditNoteScreen(note: note, notes: $viewModel.notes)
          } label: {
            Text(note.content)
          }
        }
      }
      .onAppear() {
        viewModel.getAllNotes()
      }
    }
    
    .sheet(isPresented: $createSheetStatus, onDismiss: {
      viewModel.getAllNotes()
    }) {
      AddNoteScreen(notes: $viewModel.notes)
    }
  }
}

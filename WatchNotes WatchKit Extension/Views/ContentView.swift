//
//  ContentView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Aybars Acar on 19/12/2021.
//

import SwiftUI


struct ContentView: View {
  
  @AppStorage("lineCount") var lineCount: Int = 1
  
  @State private var notes: [Note] = []
  
  @State private var text: String = ""
  
  
  private func getDocumentDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  
  private func saveChangesToLocalDataFile() {
    
    do {
      // convert the notes array to data
      let data = try JSONEncoder().encode(notes)
      
      // create a new url to save the file using the documnet directory
      let url = getDocumentDirectory().appendingPathComponent("notes")
      
      // write the data to the given url
      try data.write(to: url)
      
    } catch {
      print("Saving data has failed \(error)")
    }
  }
  
  
  private func loadNotesFromLocalDataFile() {
    DispatchQueue.main.async {
      do {
        // get the notes url path
        let url = getDocumentDirectory().appendingPathComponent("notes")
        
        // create a new property for the data
        let data = try Data(contentsOf: url)
        
        // decode the data
        notes = try JSONDecoder().decode([Note].self, from: data)
        
      } catch { }
    }
  }
  
  
  private func delete(offsets: IndexSet) {
    withAnimation {
      notes.remove(atOffsets: offsets)
      saveChangesToLocalDataFile()
    }
  }
  
  
  var body: some View {
    
    VStack {
      
      HStack(alignment: .center, spacing: 6) {
        TextField("Add New Note", text: $text)
        
        Button(action: {
          // only run if the text field is not empty
          guard text.isEmpty == false else { return }
          
          let noteToAdd = Note(id: UUID(), text: text)
          notes.append(noteToAdd)
          
          text = ""
          
          // save the notes
          saveChangesToLocalDataFile ()
          
        }, label: {
          Image(systemName: "plus.circle")
            .font(.system(size: 42, weight: .semibold))
        })
          .fixedSize()
          .buttonStyle(.plain)
          .foregroundColor(.accentColor)
      }
      
      Spacer()
      
      if notes.count >= 1 {
        List {
          ForEach(0..<notes.count, id: \.self) { i in
            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
              HStack {
                Capsule()
                  .frame(width: 4)
                  .foregroundColor(.accentColor)
                Text(notes[i].text)
                  .lineLimit(lineCount)
                  .padding(.leading, 5)
              }
            }
          }
          .onDelete(perform: delete)
        }
      } else {
        Spacer()
        Image(systemName: "note.text")
          .resizable()
          .scaledToFit()
          .foregroundColor(.gray)
          .opacity(0.25)
          .padding(25)
        Spacer()
      }
    }
    .navigationTitle("Notes")
    .onAppear {
      loadNotesFromLocalDataFile()
    }
    
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

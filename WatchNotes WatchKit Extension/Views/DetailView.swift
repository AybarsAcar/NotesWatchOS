//
//  DetailView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Aybars Acar on 20/12/2021.
//

import SwiftUI


struct DetailView: View {
  
  let note: Note
  let count: Int
  let index: Int
  
  @State private var isCreditsDisplayed: Bool = false
  @State private var isSettingsDisplayed: Bool = false
  
  var body: some View {
    
    VStack(alignment: .center, spacing: 3) {
      // HEADER
      HeaderView()
      
      // CONTENT
      Spacer()
      
      ScrollView(.vertical) {
        Text(note.text)
          .font(.title3)
          .fontWeight(.semibold)
          .multilineTextAlignment(.center)
      }
      
      Spacer()
      
      // FOOTER
      HStack(alignment: .center) {
        Image(systemName: "gear")
          .imageScale(.large)
          .onTapGesture {
            isSettingsDisplayed = true
          }
          .sheet(
            isPresented: $isSettingsDisplayed,
            onDismiss: {
              isSettingsDisplayed = false
            }
          ) {
            SettingsView()
          }
        
        Spacer()
        
        Text("\(index + 1) / \(count)")
        
        Spacer()
        
        Image(systemName: "info.circle")
          .imageScale(.large)
          .onTapGesture {
            isCreditsDisplayed = true
          }
          .sheet(
            isPresented: $isCreditsDisplayed,
            onDismiss: {
              isCreditsDisplayed = false
            }
          ) {
            CreditsView()
          }
      }
      .foregroundColor(.secondary)
      
    }
    .padding(3)
  }
}



struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(note: Note(id: UUID(), text: "A Sample Note!"), count: 5, index: 2)
  }
}

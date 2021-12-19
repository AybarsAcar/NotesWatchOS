//
//  HeaderView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Aybars Acar on 20/12/2021.
//

import SwiftUI


struct HeaderView: View {
  
  var title: String = ""
  
  var body: some View {
    
    VStack {
      // TITLE
      if !title.isEmpty {
        Text(title.uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.accentColor)
      }
      
      // SEPARATOR
      HStack {
        Capsule()
          .frame(height: 1)
        
        Image(systemName: "note.text")
        
        Capsule()
          .frame(height: 1)
      }
      .foregroundColor(.accentColor)
    }
  }
}



struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HeaderView(title: "Credits")
      HeaderView()
    }
  }
}

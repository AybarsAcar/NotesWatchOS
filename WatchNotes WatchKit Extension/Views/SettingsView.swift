//
//  SettingsView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Aybars Acar on 20/12/2021.
//

import SwiftUI


struct SettingsView: View {
  
  @AppStorage("lineCount") var lineCount: Int = 1
  
  @State private var value: Float = 1.0
  
  
  func update() {
    lineCount = Int(value)
  }
  
  
  var body: some View {

    VStack(spacing: 8) {
      // HEADER
      HeaderView(title: "Settings")
      
      // ACTUAL LINE COUNT
      Text("Lines: \(lineCount)".uppercased())
        .fontWeight(.bold)
      
      // SLIDER
      Slider(value: Binding(get: {
        self.value
      }, set: { newValue in
        self.value = newValue
        self.update()
      }), in: 1...4, step: 1)
        .accentColor(.accentColor)
      
    }
  }
}



struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}

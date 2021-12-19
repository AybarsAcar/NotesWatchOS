//
//  CreditsView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Aybars Acar on 20/12/2021.
//

import SwiftUI


struct CreditsView: View {
  
  @State private var randomNumber: Int = Int.random(in: 1...3)
  
  private var randomImage: String {
    return "developer-no\(randomNumber)"
  }
  
  var body: some View {
    VStack(spacing: 3) {
      // PROFILE IMAGE
      Image(randomImage)
        .resizable()
        .scaledToFit()
        .layoutPriority(1)
      
      // HEADER
      HeaderView(title: "Credits")
      
      // CONTENT
      Text("Aybars Acar")
        .foregroundColor(.primary)
        .fontWeight(.bold)
      
      Text("Software Engineer")
        .font(.footnote)
        .foregroundColor(.secondary)
        .fontWeight(.light)
    }
  }
}



struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
    CreditsView()
  }
}

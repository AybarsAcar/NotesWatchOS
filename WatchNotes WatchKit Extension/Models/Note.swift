//
//  Note.swift
//  WatchNotes WatchKit Extension
//
//  Created by Aybars Acar on 19/12/2021.
//

import Foundation


struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
}

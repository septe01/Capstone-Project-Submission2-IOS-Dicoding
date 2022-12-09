//
//  Color+Ext.swift
//  Capstone Project
//
//  Created by septe habudin on 09/12/22.
//

import SwiftUI


extension Color {

  static var random: Color {
    return Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }

}

//
//  Color+Ext.swift
//  Core
//
//  Created by septe habudin on 08/01/23.
//

import SwiftUI

public extension Color {

  static var random: Color {
    return Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }

}


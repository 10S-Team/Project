//
//  Fonts.swift
//  ReadProduct
//
//  Created by 김태훈 on 11/6/23.
//

import Foundation
import SwiftUI
extension Font {
  // ExtraBold
  static let extraBold28: Font = .custom(FontType.ExtraBold.rawValue, size: 28)
  // Bold
  static let bold28: Font = .custom(FontType.Bold.rawValue, size: 28)
  static let bold24: Font = .custom(FontType.Bold.rawValue, size: 24)
  static let bold18: Font = .custom(FontType.Bold.rawValue, size: 18)
  static let bold14: Font = .custom(FontType.Bold.rawValue, size: 14)
  
  // SemiBold
  static let semibold16: Font = .custom(FontType.SemiBold.rawValue, size: 16)
  
  // Medium
  static let medium18: Font = .custom(FontType.Medium.rawValue, size: 18)
  static let medium16: Font = .custom(FontType.Medium.rawValue, size: 16)
  
  // Regular
  static let regular14: Font = .custom(FontType.Regular.rawValue, size: 14)
  static let regular16: Font = .custom(FontType.Regular.rawValue, size: 16)
  
  //appFont
  static func appFont(for type : FontType, size: CGFloat) -> Font? {
    self.custom(type.rawValue, size: size)
  }
}
enum FontType: String {
  case Black = "Pretendard-Black"
  case ExtraBold = "Pretendard-ExtraBold"
  case Bold = "Pretendard-Bold"
  case SemiBold = "Pretendard-SemiBold"
  case Medium = "Pretendard-Medium"
  case Regular = "Pretendard-Regular"
  case Light = "Pretendard-Light"
  case ExtraLight = "Pretendard-ExtraLight"
  case Thin = "Pretendard-Thin"
}

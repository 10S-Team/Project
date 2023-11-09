//
//  Colors.swift
//  ReadProduct
//
//  Created by 김태훈 on 11/6/23.
//

import Foundation
import SwiftUI
extension Color {
    static let appRed: Color = Color(red: 1, green: 0.43, blue: 0.38)
    static let appYellow: Color = Color(red: 0.97, green: 0.82, blue: 0.38)
    static let appYellowPale: Color = Color(red: 0.95, green: 0.91, blue: 0.62)
    static let appGreen: Color = Color(red: 0.6, green: 0.85, blue: 0.67)
    static let appTextLightGray: Color = Color(red: 0.85, green: 0.85, blue: 0.85)
    static let appTextDarkGray: Color = Color(red: 0.59, green: 0.59, blue: 0.59)
    static func appColorAdaptScheme(type: appColor, scheme: ColorScheme) -> Color {
        switch scheme {
        case .light:
            type.color
        case .dark:
            type.darkColor
        @unknown default:
            type.color
        }
    }
    enum appColor {
        case appRed
        case appYellow
        case appYellowPale
        case appGreen
        case appTextLightGray
        case appTextDarkGray
        var color: Color {
            switch self {
            case .appRed:
                Color(red: 1, green: 0.43, blue: 0.38)
            case .appYellow:
                Color(red: 0.97, green: 0.82, blue: 0.38)
            case .appYellowPale:
                Color(red: 0.95, green: 0.91, blue: 0.62)
            case .appGreen:
                Color(red: 0.6, green: 0.85, blue: 0.67)
            case .appTextLightGray:
                Color(red: 0.85, green: 0.85, blue: 0.85)
            case .appTextDarkGray:
                Color(red: 0.59, green: 0.59, blue: 0.59)
            }
        }
        var darkColor: Color {
            switch self{
            case .appRed:
                Color(red: 1, green: 0.34, blue: 0.2)
            case .appYellow:
                Color(red: 0.98, green: 0.86, blue: 0.43)
            case .appYellowPale:
                Color(red: 0.97, green: 0.94, blue: 0.76)
            case .appGreen:
                Color(red: 0.69, green: 0.86, blue: 0.75)
            case .appTextLightGray:
                Color(red: 0.96, green: 0.96, blue: 0.96)
            case .appTextDarkGray:
                Color(red: 0.83, green: 0.83, blue: 0.83)
            }
        }
    }
}
extension UIColor {
    public static let appYellow: UIColor = UIColor(red: 0.97, green: 0.82, blue: 0.38, alpha: 1)
}
struct ColorListSampleView: View {
    var body: some View {
        ZStack {
            //백그라운드
            HStack(spacing:0){
                Rectangle().foregroundStyle(.white)
                    .ignoresSafeArea()
                    .frame(width:UIScreen.main.bounds.width/2,height: .infinity)
                Rectangle().foregroundStyle(.black)
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity)
                    .frame(height: .infinity)
            }
            VStack {
                lightAndDarkView(type: .appRed).padding(.horizontal)
                lightAndDarkView(type: .appYellow).padding(.horizontal)
                lightAndDarkView(type: .appYellowPale).padding(.horizontal)
                lightAndDarkView(type: .appGreen).padding(.horizontal)
                lightAndDarkView(type: .appTextLightGray).padding(.horizontal)
                lightAndDarkView(type: .appTextDarkGray).padding(.horizontal)
            }
        }
    }
}
#Preview {
    ColorListSampleView()
}

struct lightAndDarkView: View {
    var type: Color.appColor
    var body: some View {
        HStack(spacing: 0){
            Rectangle().foregroundStyle(Color.appColorAdaptScheme(type: type, scheme: .light))
            Rectangle().foregroundStyle(Color.appColorAdaptScheme(type: type, scheme: .dark))
        }
    }
}

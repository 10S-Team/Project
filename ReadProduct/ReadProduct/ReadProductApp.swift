//
//  ReadProductApp.swift
//  ReadProduct
//
//  Created by 김태훈 on 11/2/23.
//

import SwiftUI

@main
struct ReadProductApp: App {
  @State var splash = true
  var body: some Scene {
    WindowGroup {
      if splash {
        SplashView().onAppear{
          DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
            withAnimation {
              splash = false
            }
          }
        }
      }
      else {
        ContentView()
      }
    }
  }
}

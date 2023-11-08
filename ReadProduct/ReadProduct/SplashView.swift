//
//  SplashView.swift
//  ReadProduct
//
//  Created by 김태훈 on 11/7/23.
//

import SwiftUI
import Lottie
struct SplashView: View {
    var body: some View {
      LottieView(jsonName: "splashView", loopMode: .playOnce)
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

#Preview {
    SplashView()
}

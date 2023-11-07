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
      LottieView(jsonName: "splashView")
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SplashView()
}

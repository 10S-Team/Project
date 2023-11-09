//
//  ContentView.swift
//  ReadProduct
//
//  Created by 김태훈 on 11/2/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var scheme
    var body: some View {
        VStack {
          Image(.camera)
                .imageScale(.large)
                .foregroundStyle(.tint)
          Text("Hello, world!")
                .font(.appFont(for: .Thin, size: 20))
                .foregroundStyle(
                    Color.appColorAdaptScheme(type: .appRed,
                                              scheme: scheme))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

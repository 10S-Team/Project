//
//  ContentView.swift
//  ReadProduct
//
//  Created by 김태훈 on 11/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
          Text("Hello, world!").font(.appFont(for: .Thin, size: 25))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

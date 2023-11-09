//
//  ContentView.swift
//  ReadProduct
//
//  Created by 김태훈 on 11/2/23.
//

import SwiftUI
import PhotosUI
struct ContentView: View {
    @Environment(\.colorScheme) var scheme
    @State private var image: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var callPicker: Bool = false
    var body: some View {
        VStack {
            Text("상품을 찍어서 읽어보아요!")
            .font(.appFont(for: .Thin, size: 30))
            .foregroundColor(.appColor(type: .appTextBlack,scheme: scheme))
            .padding(.top,50)
            .accessibilityLabel("상품을 찍어서 읽어보아요!")
            
            ZStack {
                Rectangle()
                    .foregroundStyle(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.appColor(type: .appYellow,scheme: scheme))
                    .cornerRadius(20)
                Image(.camera)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .accessibilityHidden(true)
            }.padding(.horizontal,30)
                .padding(.top,50)
                .padding(.bottom,100)
                .onTapGesture {
                    sourceType = .camera
                    callPicker = true
                }
                .accessibilityLabel(.init("사진을 찍어요"))
            Button(action: {
                sourceType = .photoLibrary
                callPicker = true
            },
                   label: {
                Text("사진에서 불러오기")
                    .font(.appFont(for: .ExtraBold, size: 20))
                    .foregroundStyle(Color.appColor(type: .appRed,scheme: scheme))
            }).foregroundColor(.clear)
                .frame(maxWidth: .infinity, maxHeight: 56)
                .background(Color.appColor(type: .appYellow,scheme: scheme))
                .cornerRadius(20)
                .accessibilityLabel("사진을 불러와요")
        }.fullScreenCover(isPresented: $callPicker,
                          content: {
            ImagePicker(image: $image, type: sourceType)
                .ignoresSafeArea()
        }).padding()
    }
}

#Preview {
    ContentView()
}

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
                .font(.appFont(for: .Bold, size: 25))
                .frame(alignment: .center)
                .padding(.top, 70)
                .accessibilityLabel("상품을 찍어서 읽어보아요!")
            
            // 사진찍기 버튼
            Button(action: {
                // 코드 작성
            }, label: {
                
                VStack{
                    Image(.camera)
                        .aspectRatio(contentMode: .fill)
                        .imageScale(.large)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    Text("카메라")
                        .foregroundStyle(Color.black)
                        .font(.appFont(for: .Regular, size: 20))
                        .padding()
                }
            })
            .padding(.horizontal, 50)
            .padding(.top, 30)
            .buttonStyle(.borderedProminent)
            .tint(Color.appYellow)
            .frame(alignment: .center)
            .accessibilityLabel("사진을 찍어서 상품 이름을 알아보아요.")
    
            // 사진 불러오기 버튼
            Button(action: {
                // 코드 작성
            }, label: {
                Text("사진에서 불러오기")
                    .foregroundStyle(Color.black)
                    .font(.appFont(for: .Regular, size: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
            })
            .buttonStyle(.borderedProminent)
            .tint(Color.appYellow)
            .padding(.top, 130)
            .accessibilityLabel("사진을 가져와서 상품 이름을 알아보아요.")
        } // VStack
        .edgesIgnoringSafeArea(.bottom)
    }
}


#Preview {
    ContentView()
}

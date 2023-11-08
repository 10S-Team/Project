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
            
            Text("상품을 찍어서 읽어보아요!")
                .font(.appFont(for: .Bold, size: 25))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 70)
    
            Spacer()
            
            // 사진찍기 버튼
            Button(action: {
                // 코드 작성
            }, label: {
                
                VStack{
                    Image(.camera)
                        .imageScale(.large)
                        .frame(maxWidth: .infinity, maxHeight: 400, alignment: .center)
                        
                    Text("사진찍기")
                        .foregroundStyle(Color.black)
                        .font(.appFont(for: .Thin, size: 20))
                }
            })
            
            .buttonStyle(.borderedProminent)
            .tint(Color.appYellow)
            
            Spacer()
            
            // 사진 불러오기 버튼
            Button(action: {
                // 코드 작성
            }, label: {
                Text("사진 불러오기")
                    .foregroundStyle(Color.black)
                    .font(.appFont(for: .Regular, size: 20))
                    .frame(maxWidth: .infinity, maxHeight: 100)
            })
            .buttonStyle(.borderedProminent)
            .tint(Color.appTextLightGray)
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

#Preview {
    ContentView()
}

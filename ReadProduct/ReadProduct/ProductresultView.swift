//
//  ProductresultView.swift
//  ReadProduct
//
//  Created by 김회원 on 11/26/23.
//

import SwiftUI

struct ProductresultView: View {
    @State var productName : String = ""
    var body: some View {
        VStack {
            Image(systemName: "car")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.red)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .padding(.horizontal,35)
                .padding(.top,20)
                .padding(.bottom,65)
            
            if !productName .isEmpty {
                Text(productName)
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(Color.yellow)
                    .cornerRadius(15)
                    .padding(.horizontal,35)
                    .padding(.bottom,50)
                    .font(.appFont(for: .ExtraBold, size: 25))
            
                Button("다시 해보세요?!", action: {
                    productName = ""
                })
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height:50)
                    .background(Color.green)
                    .cornerRadius(15)
                    .padding(.horizontal, 45)
                
            }
            
            else {
                Button("어떤 상품인가요?!", action: {
                    productName = "불닭"
                })
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .frame(height:50)
                    .background(Color.yellow)
                    .cornerRadius(15)
                    .padding(.horizontal, 45)
            }
            
            Spacer()
            
            
        }
        .padding()
    }
}
#Preview {
    ProductresultView()
}

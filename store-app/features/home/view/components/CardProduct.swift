//
//  CardProduct.swift
//  store-app
//
//  Created by André  Lucas on 10/11/22.
//

import SwiftUI

struct CardProduct: View {
    var product: ProductEntity
    @State private var labelHeight = CGFloat.zero
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            .padding()
            
            Divider()
            HStack (spacing: 15){
                VStack (alignment: .leading, spacing: 8){
                    Text("Nome:")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.black)
                        .cornerRadius(8)
                    Text(product.title)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .lineLimit(2)
                }
                Spacer()
                Button{
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                } label: {
                    VStack{
                        Image(systemName: "cart.badge.plus")
                            .font(.system(size: 25))
                            .foregroundColor(.blue)
                            .padding(.vertical,5)
                        Text("R$: " + product.price.description)
                            .foregroundColor(.green)
                    }
                }
            }
            .padding()
        }
        .frame(width: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 2)
                .foregroundColor(.white)
            
        }
        .padding(.vertical)
    }
}

struct CardProduct_Previews: PreviewProvider {
    static var previews: some View {
        CardProduct(product: ProductEntity(id: 1, title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 20.00, category: "", description: "", image: ""))
    }
}

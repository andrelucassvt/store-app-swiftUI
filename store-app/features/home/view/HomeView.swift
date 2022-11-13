//
//  HomeView.swift
//  store-app
//
//  Created by André  Lucas on 06/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var search: String = ""
    @ObservedObject var controller = HomePresenter()
    
    var body: some View {
        NavigationView{
            VStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 50)
                    .foregroundColor(Color("greyEdit"))
                    .overlay{
                        TextField(
                            "Search",
                            text: $search)
                        .accentColor(.black)
                        .foregroundColor(.black)
                        .padding()
                    }
                    .padding([.bottom])
                ScrollView{
                    switch controller.state {
                    case .loading:
                        ProgressView()
                    case .success(let data):
                        ForEach(data) { item in
                            CardProduct(product: item)
                        }
                    case .failure(let error):
                        Text("Ocorreu um erro: " + error.localizedDescription)
                    default:
                        EmptyView()
                    }
                }
            }
            .padding()
            .navigationTitle("Shopping")
            .toolbar{
                Button {
                    
                } label: {
                    Image(systemName: "cart")
                        .foregroundColor(.black)
                }
            }
            .onAppear{
                controller.getProducts()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

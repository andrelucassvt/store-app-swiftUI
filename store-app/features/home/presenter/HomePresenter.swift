//
//  HomePresenter.swift
//  store-app
//
//  Created by André  Lucas on 08/11/22.
//

import Foundation

enum HomeState {
    case na
    case loading
    case success(data: [ProductEntity])
    case failure(error: Error)
}


class HomePresenter: ObservableObject {
    
    let homeInteractor = HomeInteractor()
    
    @Published private(set) var state: HomeState = .na
    
    func getProducts(){
        state = .loading
        homeInteractor.getProducts{ result in
            switch result {
            case .success(let list):
                self.state = .success(data: list)
            case .failure(let error):
                self.state = .failure(error: error)
            }
            
        }
    }
}

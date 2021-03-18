//
//  DetailPresenter.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class DetailPresenter {
    weak var viewController: DetailDisplayLogic?
    
    required init() {
        
    }
}

extension DetailPresenter: DetailPresentationLogic {
    
    func presentSomething(response: Detail.Something.Response) {
        let viewModel = Detail.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func presentFetchData(response: Detail.FetchData.Response) {
        let viewModel = Detail.FetchData.ViewModel(data: response.data)
        viewController?.displayFetchData(viewModel: viewModel)
    }
}

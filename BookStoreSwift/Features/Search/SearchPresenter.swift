//
//  SearchPresenter.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SearchPresenter {
    weak var viewController: SearchDisplayLogic?
    
    required init() {
        
    }
}

extension SearchPresenter: SearchPresentationLogic {
    
    func presentSomething(response: Search.Something.Response) {
        let viewModel = Search.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}

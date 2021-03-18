//
//  SearchInteractor.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SearchInteractor {
    var presenter: SearchPresentationLogic?
    var worker: SearchWorker?

    required init() {
        worker = SearchWorker()
    }
}

extension SearchInteractor: SearchDataStore, SearchBusinessLogic {
    func doSomething(request: Search.Something.Request) {
        worker?.doSomeWork()
        
        let response = Search.Something.Response()
        presenter?.presentSomething(response: response)
    }
}

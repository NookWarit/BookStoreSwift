//
//  HomeInteractor.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomeInteractor {
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?

    required init() {
        worker = HomeWorker()
    }
}

extension HomeInteractor: HomeDataStore, HomeBusinessLogic {
    func doSomething(request: Home.Something.Request) {
        worker?.doSomeWork()
        
        let response = Home.Something.Response()
        presenter?.presentSomething(response: response)
    }
    
    func fetchData() {
        worker?.getData(success: { response in
            let response = Home.FetchData.Response(data: response)
            self.presenter?.presentFetchData(response: response)
        }, fail: {
            print("error")
        })
    }
}

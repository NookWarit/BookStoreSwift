//
//  SearchProtocol.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol SearchDisplayLogic: class {
    func displaySomething(viewModel: Search.Something.ViewModel)
}

//MARK: Interactor
protocol SearchBusinessLogic {
    func doSomething(request: Search.Something.Request)
}

//MARK: Presenter
protocol SearchPresentationLogic {
    func presentSomething(response: Search.Something.Response)
}

//MARK: Routable
@objc protocol SearchRoutingLogic {

}

//MARK: DataStore
protocol SearchDataStore {

}

//MARK: DataPassing
protocol SearchDataPassing {
    var dataStore: SearchDataStore? { get }
}

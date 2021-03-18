//
//  HomeRouter.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    let MainStb = UIStoryboard(name: "Main", bundle: nil)
    func routeToSearch() {
        guard let home = MainStb.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else { return }
        
        viewController?.navigationController?.pushViewController(home, animated: true)
    }
    
    func routeToDetail(data: Home.FetchData.ViewModel.DisplayBookData) {
        guard let detailVC = MainStb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
//        var req = Detail.FetchData.Request(data: data)
//        detailVC.router?.dataStore?.request = req
//        detailVC.router?.dataStore?.request = Detail.FetchData.Request(data: data)
        var destination = detailVC.router!.dataStore!
        passData(
            source: dataStore!,
            destination: &destination,
            data: data)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func passData(source: HomeDataStore, destination: inout DetailDataStore, data: Home.FetchData.ViewModel.DisplayBookData) {
        destination.request = Detail.FetchData.Request(data: data)
        
    }
}

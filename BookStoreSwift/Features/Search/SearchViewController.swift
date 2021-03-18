//
//  SearchViewController.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    // MARK: @IBOutlet
    @IBOutlet weak var navBar: HeaderView!
    
    var interactor: SearchBusinessLogic?
    var router: (NSObjectProtocol & SearchRoutingLogic & SearchDataPassing)?
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
        setup()
    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = Search.Something.Request()
        interactor?.doSomething(request: request)
    }
}

//MARK: Setup & Configuration
extension SearchViewController {
    private func setup() {
        navBar.configureView(backHide: false, seachHide: true, navigationController: navigationController)
        
    }
    
    private func configure() {
        SearchConfiguration.shared.configure(self)
    }
}

extension SearchViewController : SearchDisplayLogic {
    func displaySomething(viewModel: Search.Something.ViewModel) {
        
    }
}


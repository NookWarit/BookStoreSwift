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
    
    func presentFetchData(response: Search.FetchData.Response) {
        let viewModel = Search.FetchData.ViewModel(data: response.data)
        viewController?.displayFetchData(viewModel: viewModel)
    }
}

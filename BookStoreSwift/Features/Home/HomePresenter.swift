import UIKit

class HomePresenter {
    weak var viewController: HomeDisplayLogic?
    
    required init() {
        
    }
}

extension HomePresenter: HomePresentationLogic {
    
    func presentSomething(response: Home.Something.Response) {
        let viewModel = Home.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func presentFetchData(response: Home.FetchData.Response) {
        var displayData = [Home.FetchData.ViewModel.DisplayBookData]()
        for data in response.data {
            
            for multi in data.multimedia{
                if multi.format == "superJumbo" {
                    let temp = Home.FetchData.ViewModel.DisplayBookData(img: multi.url,
                                                                        title: data.title,
                                                                        detail: data.abstract,
                                                                        byline: data.byline, url: data.url)
                    
                    displayData.append(temp)
                }
            }
        }
        let viewModel = Home.FetchData.ViewModel(displayBookData: displayData)
        viewController?.displayFetchDataSuccess(viewModel: viewModel)
    }
}

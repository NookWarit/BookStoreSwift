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
        let res  = response.data.compactMap {(data) -> Home.FetchData.ViewModel.DisplayBookData? in

            let dataImg = data.multimedia.filter { (MultimediaDataModel) -> Bool in
                return MultimediaDataModel.format == "superJumbo"
            }
            
            return Home.FetchData.ViewModel.DisplayBookData(
                img: dataImg.first?.url ?? " ",
                title: data.title,
                detail: data.abstract,
                byline: data.byline,
                url: data.url
            )
        }
        let viewModel = Home.FetchData.ViewModel(displayBookData: res)
        viewController?.displayFetchDataSuccess(viewModel: viewModel)
    }
}

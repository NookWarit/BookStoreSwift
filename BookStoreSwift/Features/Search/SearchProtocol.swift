import Foundation

//MARK: ViewController
protocol SearchDisplayLogic: class {
    func displaySomething(viewModel: Search.Something.ViewModel)
    func displayFetchData(viewModel: Search.FetchData.ViewModel)
}

//MARK: Interactor
protocol SearchBusinessLogic {
    func doSomething(request: Search.Something.Request)
    func fetchData()
    func searchData(request: Search.SearchData.Request)
}

//MARK: Presenter
protocol SearchPresentationLogic {
    func presentSomething(response: Search.Something.Response)
    func presentFetchData(response: Search.FetchData.Response)
}

//MARK: Routable
protocol SearchRoutingLogic {
    func routeToDetail(data: Home.FetchData.ViewModel.DisplayBookData)
}

//MARK: DataStore
protocol SearchDataStore {
    var request: Search.FetchData.Request? { get set }
}

//MARK: DataPassing
protocol SearchDataPassing {
    var dataStore: SearchDataStore? { get }
}

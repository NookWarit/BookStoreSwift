import Foundation

//MARK: ViewController
protocol HomeDisplayLogic: class {
    func displaySomething(viewModel: Home.Something.ViewModel)
    func displayFetchDataSuccess(viewModel: Home.FetchData.ViewModel)
}

//MARK: Interactor
protocol HomeBusinessLogic {
    func doSomething(request: Home.Something.Request)
    func fetchData() 
}

//MARK: Presenter
protocol HomePresentationLogic {
    func presentSomething(response: Home.Something.Response)
    func presentFetchData(response: Home.FetchData.Response)
}

//MARK: Routable
protocol HomeRoutingLogic {
    func routeToSearch(data: [Home.FetchData.ViewModel.DisplayBookData])
    func routeToDetail(data: Home.FetchData.ViewModel.DisplayBookData)
}

//MARK: DataStore
protocol HomeDataStore {

}

//MARK: DataPassing
protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

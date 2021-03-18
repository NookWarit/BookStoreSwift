import Foundation

//MARK: ViewController
protocol DetailDisplayLogic: class {
    func displaySomething(viewModel: Detail.Something.ViewModel)
    func displayFetchData(viewModel: Detail.FetchData.ViewModel)
}

//MARK: Interactor
protocol DetailBusinessLogic {
    func doSomething(request: Detail.Something.Request)
    func fetchData()
}

//MARK: Presenter
protocol DetailPresentationLogic {
    func presentSomething(response: Detail.Something.Response)
    func presentFetchData(response: Detail.FetchData.Response)
}

//MARK: Routable
@objc protocol DetailRoutingLogic {
    func openLink(link: String)
}

//MARK: DataStore
protocol DetailDataStore {
    var request: Detail.FetchData.Request? { get set }
}

//MARK: DataPassing
protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
    
}

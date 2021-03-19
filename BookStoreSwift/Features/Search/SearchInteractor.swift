import UIKit

class SearchInteractor {
    var presenter: SearchPresentationLogic?
    var worker: SearchWorker?
    var req: Search.FetchData.Request?
    

    required init() {
        worker = SearchWorker()
    }
}

extension SearchInteractor: SearchDataStore, SearchBusinessLogic {
    var request: Search.FetchData.Request? {
        get {
            return req
        }
        set {
            req = newValue
        }
    }
    
    func doSomething(request: Search.Something.Request) {
        worker?.doSomeWork()
        
        let response = Search.Something.Response()
        presenter?.presentSomething(response: response)
    }
    
    func fetchData() {
        let response = Search.FetchData.Response(data: req!.data)
        presenter?.presentFetchData(response: response)
    }
}

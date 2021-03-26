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
    
    func searchData(request: Search.SearchData.Request) {
        let response = Search.FetchData.Response(data: req!.data)
        let data = response.data.filter { (data) -> Bool in
            return data.title.contains(request.data)
        }
        let res = Search.FetchData.Response(data: data)
        presenter?.presentFetchData(response: res)
        
    }
}

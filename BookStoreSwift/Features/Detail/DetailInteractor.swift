import UIKit

class DetailInteractor {
    var presenter: DetailPresentationLogic?
    var worker: DetailWorker?
    var req: Detail.FetchData.Request?

    required init() {
        worker = DetailWorker()
    }
    
   
}

extension DetailInteractor: DetailDataStore, DetailBusinessLogic {
    var request: Detail.FetchData.Request? {
        get {
            return req
        }
        set {
            req = newValue
        }
    }
    
    func doSomething(request: Detail.Something.Request) {
        worker?.doSomeWork()
        
        let response = Detail.Something.Response()
        presenter?.presentSomething(response: response)
    }
    
    func fetchData() {
        let response = Detail.FetchData.Response(data: req!.data)
        presenter?.presentFetchData(response: response)
    }
}

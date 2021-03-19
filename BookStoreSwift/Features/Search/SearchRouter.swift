import UIKit

class SearchRouter: NSObject, SearchRoutingLogic, SearchDataPassing {
    weak var viewController: SearchViewController?
    var dataStore: SearchDataStore?
    let MainStb = UIStoryboard(name: "Main", bundle: nil)
    
    func routeToDetail(data: Home.FetchData.ViewModel.DisplayBookData) {
        guard let detailVC = MainStb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        var destination = detailVC.router!.dataStore!
        passData(
            source: dataStore!,
            destination: &destination,
            data: data)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func passData(source: SearchDataStore, destination: inout DetailDataStore, data: Home.FetchData.ViewModel.DisplayBookData) {
        destination.request = Detail.FetchData.Request(data: data)
        
    }
}

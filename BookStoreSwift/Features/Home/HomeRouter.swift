import UIKit

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    let MainStb = UIStoryboard(name: "Main", bundle: nil)
    func routeToSearch(data: [Home.FetchData.ViewModel.DisplayBookData]) {
        guard let searchVC = MainStb.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController else { return }
        var destination = searchVC.router!.dataStore!
        passDataToSearch(source: dataStore!, destination: &destination, data: data)
        viewController?.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func passDataToSearch(source: HomeDataStore, destination: inout SearchDataStore, data: [Home.FetchData.ViewModel.DisplayBookData]) {
        destination.request = Search.FetchData.Request(data: data)
        
    }
    
    func routeToDetail(data: Home.FetchData.ViewModel.DisplayBookData) {
        guard let detailVC = MainStb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        var destination = detailVC.router!.dataStore!
        passDataToDetail(
            source: dataStore!,
            destination: &destination,
            data: data)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func passDataToDetail(source: HomeDataStore, destination: inout DetailDataStore, data: Home.FetchData.ViewModel.DisplayBookData) {
        destination.request = Detail.FetchData.Request(data: data)
        
    }
}

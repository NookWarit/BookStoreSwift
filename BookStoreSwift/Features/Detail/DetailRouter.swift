import UIKit

class DetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {
    var request: Detail.FetchData.Request?
    
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?
    
    func openLink(link: String) {
        guard let url = URL(string: link), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

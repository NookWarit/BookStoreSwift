import UIKit
import SwiftyJSON

class HomeWorker {
    func doSomeWork() {

    }
    
    // MARK: - Variable
    private let network = GetAPI()
    
    // MARK: - Function
    func getData(success: @escaping (_ data: [DataModel]) -> Void,
                 fail: @escaping () -> Void) {
        network.getData(completed: { response in
            let items = response["results"].arrayValue
            let data = items.map({ DataModel(data: $0) })
            success(data)
            
        })
    }
}



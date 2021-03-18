import Foundation
import SwiftyJSON
import Alamofire

class GetAPI {
    func getData(completed: @escaping (_ response: JSON) -> Void) {
        AF.request("http://api.nytimes.com/svc/topstories/v2/books.json?api-key=GDrQ2aBDKGj6DELALg9H4JeXLysN1peW",
                          method: .get)
            .responseJSON(completionHandler: { response in
                completed(JSON(response.value ?? [:]))
        })
    }
}

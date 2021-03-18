import Foundation
import SwiftyJSON

struct DataModel {
    var title: String
    var abstract: String
    var url: String
    var byline: String
    var multimedia: [MultimediaDataModel]
    
    
    init() {
        title = ""
        abstract = ""
        url = ""
        byline = ""
        multimedia = [MultimediaDataModel]()
    }
    
    init(data: JSON) {
        title = data["title"].stringValue
        abstract = data["abstract"].stringValue
        url = data["url"].stringValue
        byline = data["byline"].stringValue
        multimedia = data["multimedia"].arrayValue.map({MultimediaDataModel(data: $0)})
    }
}

struct MultimediaDataModel {
    var url: String
    var format: String
    
    init() {
        url = ""
        format = ""
    }
    
    init(data: JSON) {
        url = data["url"].stringValue
        format = data["format"].stringValue
    }
}

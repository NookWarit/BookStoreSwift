import UIKit

enum Home {
    enum Something {
        struct Request{

        }
        struct Response{

        }
        struct ViewModel{

        }
    }
    
    enum FetchData {
        struct Request{

        }
        struct Response{
            var data: [DataModel]
        }
        struct ViewModel{
            struct DisplayBookData {
                var img: String
                var title: String
                var detail: String
                var byline: String
            }
            var displayBookData: [DisplayBookData]
        }
    }
    
}

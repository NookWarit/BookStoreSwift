import UIKit

enum Search {
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
            var data: [Home.FetchData.ViewModel.DisplayBookData]
        }
        struct Response{
            var data: [Home.FetchData.ViewModel.DisplayBookData]
        }
        struct ViewModel{
            var data: [Home.FetchData.ViewModel.DisplayBookData]
        }
    }
}

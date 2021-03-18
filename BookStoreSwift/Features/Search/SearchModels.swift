//
//  SearchModels.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

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

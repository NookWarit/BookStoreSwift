//
//  DetailModels.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Detail {
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
            var data: Home.FetchData.ViewModel.DisplayBookData
        }
        struct Response{
            var data: Home.FetchData.ViewModel.DisplayBookData
        }
        struct ViewModel{
            var data: Home.FetchData.ViewModel.DisplayBookData
        }
    }
}

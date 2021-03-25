//
//  Image.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(url: String, defaultImage: String) {
        sd_setImage(with: URL(string: url),
                    completed: { (image, error, _, _) in
                        if error != nil {
                            self.image = UIImage(named: defaultImage)
                        } else {
                            self.image = image
                        }
        })
    }
}

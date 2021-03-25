//
//  CollectionViewCell.swift
//  BookStoreSwift
//
//  Created by Foodstory on 17/3/2564 BE.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {
    // MARK: IBOutlet
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.dropShadowView(color: .black, opacity: 0.1, offSet: CGSize.zero, radius: 10, scale: false)
        cardView.layer.cornerRadius = 8
        cardView.layoutIfNeeded()
        
        bgView.layer.masksToBounds = true
        bgView.roundCorners(corners: [.bottomRight, .bottomLeft ], radius: 8)
        
        img.layer.cornerRadius = 8
        img.clipsToBounds = true
        img.layoutIfNeeded()
    }
    
    func configureCell(title: String, imageUrl: String) {
        titleLabel.setLabelWith(text: title, color: .white, font: .textAverage10())
        img.setImage(url: imageUrl, defaultImage: "")
    }

}

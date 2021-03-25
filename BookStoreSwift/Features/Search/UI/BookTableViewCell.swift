import UIKit

class BookTableViewCell: UITableViewCell {
    // MARK: - IBoutlet
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.dropShadowView(color: .black, opacity: 0.2, offSet: CGSize(width: 3, height: 3), radius: 8, scale: false)
        cardView.layer.cornerRadius = 8
    }
    
    func configureCell(urlImage: String, title: String, detail: String, byline: String) {
        img.setImage(url: urlImage, defaultImage: "")
        titleLable.setLabelWith(text: title, color: .black, font: .textAverage14())
        detailLabel.setLabelWith(text: detail, color: UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1), font: .textAverage10())
        bylineLabel.setLabelWith(text: byline, color: UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1), font: .textAverage8())
    }
    
}

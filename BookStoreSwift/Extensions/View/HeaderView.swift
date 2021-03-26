import Foundation
import UIKit
protocol HeaderViewDelegate: class {
    func searchDidTap()
}

class HeaderView: UIView {
    // MARK: IBOutlet
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    // MARK: - Varible
    weak var delegate: HeaderViewDelegate?
    private weak var navigationController: UINavigationController?
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    // MARK: - Function
    func commonInit() {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cardView.layer.masksToBounds = true
        cardView.dropShadowView(color: .darkGray, opacity: 0.5, offSet: CGSize(width: 5, height: 3), radius: 5, scale: false)
        cardView.roundCorners(corners: [.bottomRight, .bottomLeft ], radius: 8)
        
        self.titleLabel.setLabelWith(text: "The New York Time", color: .black, font: .textChomsky18())
    }
    
    func configureView(backHide: Bool, seachHide: Bool, navigationController: UINavigationController?) {
        self.backBtn.isHidden = backHide
        self.searchBtn.isHidden = seachHide
        self.navigationController = navigationController
    }
    
    @IBAction func backDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchDidTap() {
        delegate?.searchDidTap()
    }
    
}

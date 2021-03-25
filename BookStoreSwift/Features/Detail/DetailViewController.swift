import UIKit

class DetailViewController: UIViewController {
    // MARK: @IBOutlet
    @IBOutlet weak var navBar: HeaderView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgBook: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var openWebBtn: UIButton!
    @IBOutlet weak var viewButton: UIView!
    
    var interactor: DetailBusinessLogic?
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    
    var displayData: Detail.FetchData.ViewModel?
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
        setup()
        interactor?.fetchData()
    }
    
    // MARK: Do something
    @IBAction func openWebDidTab(_ sender: Any) {
        router?.openLink(link: displayData?.data.url ?? "")
    }
    
    func doSomething() {
        let request = Detail.Something.Request()
        interactor?.doSomething(request: request)
    }
}

//MARK: Setup & Configuration
extension DetailViewController {
    private func setup() {
        navBar.configureView(backHide: false, seachHide: true, navigationController: navigationController)
        titleLabel.font = .textAverage18()
        detailLabel.font = .textAverage14()
        detailLabel.textColor = UIColor.systemGray
        openWebBtn.setTitle("Open Website", for: .normal)
        openWebBtn.titleLabel?.font = .textAverage16()
        openWebBtn.setTitleShadowColor(.black, for: .normal)
        viewButton.layer.cornerRadius = 8
        viewButton.dropShadowView(color: .black, opacity: 0.1, offSet: CGSize(width: 3, height: 3), radius: 8, scale: false)
    }
    
    private func configure() {
        DetailConfiguration.shared.configure(self)
    }
}

extension DetailViewController : DetailDisplayLogic {
    func displaySomething(viewModel: Detail.Something.ViewModel) {
        
    }
    
    func displayFetchData(viewModel: Detail.FetchData.ViewModel) {
        displayData = viewModel
        
        let data = viewModel.data
        titleLabel.text = data.title
        imgBook.setImage(url: data.img, defaultImage: "")
        detailLabel.text = data.detail
        
    }
}

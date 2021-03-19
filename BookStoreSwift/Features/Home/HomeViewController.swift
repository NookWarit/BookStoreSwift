import UIKit

class HomeViewController: UIViewController {
    // MARK: @IBOutlet
    @IBOutlet weak var navBar: HeaderView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    let collectionViewCell = "CollectionViewCell"
    var displayData = [Home.FetchData.ViewModel.DisplayBookData]()
    
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
        fetchData()
    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = Home.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func fetchData() {
        interactor?.fetchData()
    }
}

//MARK: Setup & Configuration
extension HomeViewController {
    private func setup() {
        navBar.configureView(backHide: true, seachHide: false, navigationController: navigationController)
        navBar.delegate = self
        
        collectionView.register(UINib(nibName: collectionViewCell, bundle: nil), forCellWithReuseIdentifier: collectionViewCell)
        
    }
    
    private func configure() {
        HomeConfiguration.shared.configure(self)
    }
}

extension HomeViewController : HomeDisplayLogic {
    func displaySomething(viewModel: Home.Something.ViewModel) {
        
    }
    
    func displayFetchDataSuccess(viewModel: Home.FetchData.ViewModel) {
        displayData = viewModel.displayBookData
        collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCell, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell()}
        cell.configureCell(title: displayData[indexPath.row].title, imageUrl: displayData[indexPath.row].img)
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToDetail(data: displayData[indexPath.row])
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/2)-5, height: collectionView.frame.height/2.5)
    }
}

extension HomeViewController: HeaderViewDelegate {
    func searchDidTap() {
        router?.routeToSearch(data: displayData)
    }
}

import UIKit

class SearchViewController: UIViewController {
    // MARK: @IBOutlet
    @IBOutlet weak var navBar: HeaderView!
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: SearchBusinessLogic?
    var router: (NSObjectProtocol & SearchRoutingLogic & SearchDataPassing)?
    let bookTableViewCell = "BookTableViewCell"
    var displayData = [Home.FetchData.ViewModel.DisplayBookData]()
    var searchActive : Bool = false
    
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
        showProgress()
    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = Search.Something.Request()
        interactor?.doSomething(request: request)
    }
}

//MARK: Setup & Configuration
extension SearchViewController {
    private func setup() {
        navBar.configureView(backHide: false, seachHide: true, navigationController: navigationController)
        
        tableView.register(UINib(nibName: bookTableViewCell, bundle: nil), forCellReuseIdentifier: bookTableViewCell)
        
    }
    
    private func configure() {
        SearchConfiguration.shared.configure(self)
    }
}

extension SearchViewController : SearchDisplayLogic {
    func displaySomething(viewModel: Search.Something.ViewModel) {
        
    }
    
    func displayFetchData(viewModel: Search.FetchData.ViewModel) {
        displayData = viewModel.data
        tableView.reloadData()
        hideProgress()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if(searchText.count == 0){
                interactor?.fetchData()
            } else {
                interactor?.searchData(request: Search.SearchData.Request(data: searchBar.text ?? ""))
            }
            self.tableView.reloadData()
        }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: bookTableViewCell, for: indexPath) as? BookTableViewCell
            cell?.configureCell(urlImage: displayData[indexPath.row].img, title: displayData[indexPath.row].title, detail: displayData[indexPath.row].detail, byline: displayData[indexPath.row].byline)
            hideProgress()
        return cell ?? UITableViewCell()
    }
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            router?.routeToDetail(data: displayData[indexPath.row])
    }
}

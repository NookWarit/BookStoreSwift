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
    var filtered:[Home.FetchData.ViewModel.DisplayBookData] = []
    
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
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = displayData.filter({(txt) -> Bool in
            let tmp = txt.title
            let range = tmp.range(of: searchText, options: String.CompareOptions.caseInsensitive, range: Range<String.Index>?.none, locale: Locale?.none)
            return (range != nil)
        })
        
            if(filtered.count == 0){
                searchActive = false;
            } else {
                searchActive = true;
            }
            self.tableView.reloadData()
        }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return displayData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: bookTableViewCell, for: indexPath) as? BookTableViewCell
        if(searchActive){
            cell?.configureCell(urlImage: filtered[indexPath.row].img, title: filtered[indexPath.row].title, detail: filtered[indexPath.row].detail, byline: filtered[indexPath.row].byline)
        } else {
        cell?.configureCell(urlImage: displayData[indexPath.row].img, title: displayData[indexPath.row].title, detail: displayData[indexPath.row].detail, byline: displayData[indexPath.row].byline)
        }
        return cell ?? UITableViewCell()
    }
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(searchActive){
            router?.routeToDetail(data: filtered[indexPath.row])
        } else {
            router?.routeToDetail(data: displayData[indexPath.row])
        }
        
    }
}

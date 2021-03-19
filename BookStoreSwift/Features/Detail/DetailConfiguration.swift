import Foundation

class DetailConfiguration {
    static let shared: DetailConfiguration = DetailConfiguration()
    
    func configure(_ viewController: DetailViewController) {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

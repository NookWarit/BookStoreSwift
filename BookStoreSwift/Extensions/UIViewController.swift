import UIKit
import NVActivityIndicatorView

// MARK: - Showprogress

extension UIViewController: NVActivityIndicatorViewable {
    func showProgress() {
        let size = CGSize(width: 50, height: 50)
        startAnimating(size, type: NVActivityIndicatorType.pacman, color: .black, padding: 0)
    }

    func hideProgress() {
        stopAnimating()
    }

}




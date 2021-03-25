import UIKit
import NVActivityIndicatorView

// MARK: - Showprogress
extension UIViewController {
    func show() {
//        let nv = NVActivityIndicatorView.init(frame: CGRect(x: 0, y: 0, width: 42, height: 42),
//                                     type: NVActivityIndicatorType.ballBeat,
//                                     color: UIColor.blue)
        let nv = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100),
                                         type: NVActivityIndicatorType.ballBeat,
                                         color: UIColor.green, padding: 10)
        nv.startAnimating()
        
    }
}
//extension UIViewController: NVActivityIndicatorViewable {
//    func showProgress() {
//        let size = CGSize(width: 42, height: 42)
//        activityIndicatorViewstartAnimating(size, message: "",
//                       type: NVActivityIndicatorType.ballPulse,
//                       color: .darkMint)
//    }
//
//    func hideProgress() {
//        stopAnimating()
//    }
//
//    func updateMessage(message: String) {
//        NVActivityIndicatorPresenter.sharedInstance.setMessage(message)
//    }
//
//}




import Foundation
import UIKit

extension UIFont {
    private static let chomsky = "Chomsky"
    private static let average = "Average-Regular"
    
    class func textChomsky18() -> UIFont {
        let size: CGFloat = 18
        return UIFont(name: chomsky, size: size)!
    }
    
    class func textAverage18() -> UIFont {
        let size: CGFloat = 18
        return UIFont(name: average, size: size)!
    }
    
    class func textAverage16() -> UIFont {
        let size: CGFloat = 16
        return UIFont(name: average, size: size)!
    }
    
    class func textAverage14() -> UIFont {
        let size: CGFloat = 14
        return UIFont(name: average, size: size)!
    }
    
    class func textAverage12() -> UIFont {
        let size: CGFloat = 12
        return UIFont(name: average, size: size)!
    }
    
    class func textAverage10() -> UIFont {
        let size: CGFloat = 10
        return UIFont(name: average, size: size)!
    }
    
    class func textAverage8() -> UIFont {
        let size: CGFloat = 8
        return UIFont(name: average, size: size)!
    }
}

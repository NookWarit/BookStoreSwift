import UIKit

extension UIView {
    func dropShadowView(color: UIColor, opacity: Float = 0.2, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            if #available(iOS 11.0, *) {
                let cornerMasks = [
                    corners.contains(.topLeft) ? CACornerMask.layerMinXMinYCorner : nil,
                    corners.contains(.topRight) ? CACornerMask.layerMaxXMinYCorner : nil,
                    corners.contains(.bottomLeft) ? CACornerMask.layerMinXMaxYCorner : nil,
                    corners.contains(.bottomRight) ? CACornerMask.layerMaxXMaxYCorner : nil,
                    corners.contains(.allCorners) ? [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner, CACornerMask.layerMinXMaxYCorner, CACornerMask.layerMaxXMaxYCorner] : nil
                    ].compactMap({ $0 })

                var maskedCorners: CACornerMask = []
                cornerMasks.forEach { (mask) in maskedCorners.insert(mask) }

                self.clipsToBounds = true
                self.layer.cornerRadius = radius
                self.layer.maskedCorners = maskedCorners
            } else {
                let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
                let mask = CAShapeLayer()
                mask.path = path.cgPath
                self.layer.mask = mask
            }
        }
}

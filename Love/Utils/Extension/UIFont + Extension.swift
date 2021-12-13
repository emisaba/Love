import UIKit

extension UIFont {
    
    static func mamelon(size: CGFloat) -> UIFont {
        return UIFont(name: "Mamelon-5-Hi-Regular", size: size) ?? .systemFont(ofSize: size)
    }
}

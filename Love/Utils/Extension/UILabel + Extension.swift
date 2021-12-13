import UIKit

extension UILabel {
    
    static func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.layer.borderWidth = 8
        label.layer.borderColor = UIColor.customRed().cgColor
        
        let firstAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.mamelon(size: 25),
                                                              .foregroundColor: UIColor.black]
        let secondAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.mamelon(size: 27),
                                                               .foregroundColor: UIColor.customRed()]
        let attributedText = NSMutableAttributedString(string: "一旦このフォント", attributes: firstAttributes)
        attributedText.append(NSAttributedString(string: " 愛", attributes: secondAttributes))
        label.attributedText = attributedText
        
        return label
    }
}

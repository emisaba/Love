import UIKit

extension UITextView {
    
    static func createDescriptionBabble() -> UITextView {
        let tv = UITextView()
        tv.font = .mamelon(size: 18)
        tv.backgroundColor = .clear
        tv.layer.cornerRadius = 10
        tv.textColor = .black
        tv.text = "テキスト テキスト テキスト テキスト テキスト テキストテキスト テキスト テキスト テキスト テキスト テキストテキスト テキスト テキスト テキスト テキスト テキストテキスト テキスト テキスト テキスト テキスト テキスト"
        tv.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tv.isUserInteractionEnabled = false
        return tv
    }
}

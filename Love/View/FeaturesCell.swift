import UIKit

class FeaturesCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10
        iv.backgroundColor = .systemGray
        return iv
    }()
    
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "タイトル"
//        label.textAlignment = .center
//        label.backgroundColor = .systemGreen
//        return label
//    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         paddingTop: 20,
                         paddingBottom: 20)
        
//        addSubview(titleLabel)
//        titleLabel.anchor(top: imageView.bottomAnchor,
//                          left: leftAnchor,
//                          right: rightAnchor,
//                          height: frame.height * 0.2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

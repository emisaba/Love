import UIKit

class TopViewControllerCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    public let headerView = HeaderView()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerView)
        headerView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

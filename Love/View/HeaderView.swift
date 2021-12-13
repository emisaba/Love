import UIKit

class HeaderView: UIView {
    
    // MARK: - Properties
    
    public let themeLabel = UILabel.createTitleLabel()
    
    private let identifier = "identifier"
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.register(FeaturesCell.self, forCellWithReuseIdentifier: identifier)
        cv.backgroundColor = .white
        cv.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
        cv.layer.borderWidth = 5
        cv.layer.borderColor = UIColor.lightGray.cgColor
        return cv
    }()
    
    private lazy var rightBorder = createSideBorder()
    private lazy var leftBorder = createSideBorder()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(collectionView)
        collectionView.anchor(left: leftAnchor,
                              bottom: bottomAnchor,
                              right: rightAnchor,
                              paddingLeft: 1.5,
                              paddingRight: 1.5,
                              height: frame.height - 90)
        
        addSubview(themeLabel)
        themeLabel.anchor(left: leftAnchor,
                          bottom: collectionView.topAnchor,
                          right: rightAnchor,
                          paddingBottom: -5,
                          height: 90)
        
        addSubview(rightBorder)
        rightBorder.anchor(top: themeLabel.bottomAnchor, right: rightAnchor)
        rightBorder.setDimensions(height: 45, width: 8)
        
        addSubview(leftBorder)
        leftBorder.anchor(top: themeLabel.bottomAnchor, left: leftAnchor)
        leftBorder.setDimensions(height: 45, width: 8)
    }
    
    // MARK: - Helper
    
    func createSideBorder() -> UIView {
        let view = UIView()
        view.backgroundColor = .customRed()
        return view
    }
}

// MARK: - UICollectionViewDataSource

extension HeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FeaturesCell
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension HeaderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let minimumLineSpace: CGFloat = 5 * 2
        let contentInset: CGFloat = 5 * 2
        let width = (frame.width - (contentInset + minimumLineSpace)) / 3
        
        return CGSize(width: width, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

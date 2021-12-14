import UIKit

class CaseViewController: UIViewController {
    
    // MARK: - Properties
    
    public let themeLabel = UILabel.createTitleLabel()
    
    private lazy var rightBorder = createSideBorder()
    private lazy var leftBorder = createSideBorder()
    
    private let descriptionBabble = UITextView.createDescriptionBabble()
    private let descriptionBabbleShadow = UIView.createShadouwView()
    
    private let identifier = "identifier"
    
    private lazy var bookCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(CaseViewCell.self, forCellWithReuseIdentifier: identifier)
        cv.backgroundColor = .white
        cv.contentInset = UIEdgeInsets(top: 50, left: 20, bottom: 20, right: 20)
        cv.layer.cornerRadius = 50
        
        let pangesture = UIPanGestureRecognizer(target: self, action: #selector(didPullbookCV))
        cv.addGestureRecognizer(pangesture)
        
        return cv
    }()
    
    private let bookCollectionViewTrigger: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .lightGray.withAlphaComponent(0.3)
        return view
    }()
    
    private var bookCollectionViewY: CGFloat = 0
    private let backGroundView = UIView()
 
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let height = descriptionBabble.sizeThatFits(CGSize(width: descriptionBabble.frame.size.width,
                                                           height: CGFloat.greatestFiniteMagnitude)).height
        descriptionBabble.heightAnchor.constraint(equalToConstant: height + 20).isActive = true
        descriptionBabbleShadow.heightAnchor.constraint(equalToConstant: height + 20).isActive = true
        
        bookCollectionViewY = 300 + descriptionBabble.frame.height + view.safeAreaInsets.top
        
        view.addSubview(bookCollectionView)
        bookCollectionView.frame = CGRect(x: 0, y: bookCollectionViewY, width: view.frame.width, height: view.frame.size.height - 100)
        
        view.addSubview(bookCollectionViewTrigger)
        bookCollectionViewTrigger.frame = CGRect(x: bookCollectionView.frame.width / 2 - 25,
                                                 y: bookCollectionView.frame.origin.y + 20,
                                                 width: 50, height: 10)
    }
    
    // MARK: - Action
    
    @objc func didPullbookCV(sender: UIPanGestureRecognizer) {
        let transitionY = sender.translation(in: view).y
        
        switch sender.state {
        case .changed:
            bookCollectionViewTrigger.frame.origin.y += transitionY
            bookCollectionView.frame.origin.y += transitionY
            sender.setTranslation(CGPoint.zero, in: view)
            
        case .ended:
//            bookCollectionView.frame.origin.y = direction == .up ? 100 : bookCollectionViewY
        break
            
        default:
            break
        }
    }
    
    // MARK: - Helper
    
    func configureUI() {
        view.backgroundColor = .white
        backGroundView.backgroundColor = .systemGray.withAlphaComponent(0.1)
        
        view.addSubview(backGroundView)
        backGroundView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              left: view.leftAnchor,
                              bottom: view.bottomAnchor,
                              right: view.rightAnchor,
                              paddingTop: 180)
        
        view.addSubview(themeLabel)
        themeLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingTop: 30,
                          paddingLeft: 20,
                          paddingRight: 20,
                          height: 120)
        
        view.addSubview(rightBorder)
        rightBorder.anchor(top: themeLabel.bottomAnchor,
                           right: view.rightAnchor,
                           paddingRight: 20)
        rightBorder.setDimensions(height: 60, width: 8)
        
        view.addSubview(leftBorder)
        leftBorder.anchor(top: themeLabel.bottomAnchor,
                          left: view.leftAnchor,
                          paddingLeft: 20)
        leftBorder.setDimensions(height: 60, width: 8)
        
        view.addSubview(descriptionBabbleShadow)
        descriptionBabbleShadow.anchor(top: leftBorder.bottomAnchor,
                                       left: view.leftAnchor,
                                       right: view.rightAnchor,
                                       paddingTop: 50,
                                       paddingLeft: 30,
                                       paddingRight: 30)
        
        view.addSubview(descriptionBabble)
        descriptionBabble.anchor(top: leftBorder.bottomAnchor,
                                 left: view.leftAnchor,
                                 right: view.rightAnchor,
                                 paddingTop: 50,
                                 paddingLeft: 30,
                                 paddingRight: 30)
    }
    
    func createSideBorder() -> UIView {
        let view = UIView()
        view.backgroundColor = .customRed()
        return view
    }
}

// MARK: - UICollectionViewDataSource

extension CaseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CaseViewCell
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CaseViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CaseViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width - 40) / 3
        return CGSize(width: width, height: width + 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 23
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

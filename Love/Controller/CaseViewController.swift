import UIKit
import Hero

class CaseViewController: UIViewController {
    
    // MARK: - Properties
    
    public let themeLabel = UILabel.createTitleLabel()
    
    private lazy var rightBorder = createSideBorder()
    private lazy var leftBorder = createSideBorder()
 
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(themeLabel)
        themeLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingLeft: 10,
                          paddingRight: 10,
                          height: 120)
        
        view.addSubview(rightBorder)
        rightBorder.anchor(top: themeLabel.bottomAnchor,
                           right: view.rightAnchor,
                           paddingRight: 10)
        rightBorder.setDimensions(height: 60, width: 8)
        
        view.addSubview(leftBorder)
        leftBorder.anchor(top: themeLabel.bottomAnchor,
                          left: view.leftAnchor,
                          paddingLeft: 10)
        leftBorder.setDimensions(height: 60, width: 8)
    }
    
    // MARK: - Helper
    
    func createSideBorder() -> UIView {
        let view = UIView()
        view.backgroundColor = .customRed()
        return view
    }
}

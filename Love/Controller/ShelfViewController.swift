import UIKit
import Hero

class ShelfViewController: UIViewController {
    
    // MARK: - Properties
    
    private let identifier = "identifier"
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(TopViewControllerCell.self, forCellWithReuseIdentifier: identifier)
        cv.backgroundColor = .white.withAlphaComponent(0.95)
        return cv
    }()
    
    private let cardTransionManager = CardTransionManager()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

// MARK: - UICollectionViewDataSource

extension ShelfViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! TopViewControllerCell
        return cell
    }
}

// MARK: - UICollectionview

extension ShelfViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? TopViewControllerCell else { return }
        cell.hero.id = "targetCase"
        
        let vc = CaseViewController()
        vc.isHeroEnabled = true
        vc.themeLabel.hero.id = "targetCase"
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true, completion: nil)
    }
    
    func selsctCellCardView() -> UIView? {
        guard let indexPath = collectionView.indexPathsForSelectedItems else { return nil }
        let cell = collectionView.cellForItem(at: indexPath.first ?? IndexPath(row: 0, section: 0)) as! TopViewControllerCell
        let cardView = cell.headerView
        return cardView
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ShelfViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 40, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

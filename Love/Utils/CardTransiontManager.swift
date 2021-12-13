import UIKit

enum TransitionType {
    case presentaion
    case dismissal
}

class CardTransionManager: NSObject {
    let transitionDuration: Double = 0.8
    var transition: TransitionType = .presentaion
    let shrinkDuration: Double = 0.2
    
    lazy var blurEffectView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blur)
        return view
    }()
    
    let dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init() {
        super.init()
    }
    
    // MARK: - Helpers
    
    func addBackgroundViews(to containerView: UIView) {
        blurEffectView.frame = containerView.frame
        blurEffectView.alpha = 0.0
        containerView.addSubview(blurEffectView)
        
        dimmingView.frame = containerView.frame
        dimmingView.alpha = 0.0
        containerView.addSubview(dimmingView)
    }
}

// MARK: - UIViewControllerAnimatedTransitioning

extension CardTransionManager: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        containerView.subviews.forEach { $0.removeFromSuperview() }
        
        addBackgroundViews(to: containerView)
        
        let fromView = transitionContext.viewController(forKey: .from)
        let toView = transitionContext.viewController(forKey: .to)
        
        guard let cardView = (transition == .presentaion) ? (fromView as! ShelfViewController).selsctCellCardView() :
                                                                (toView as! ShelfViewController).selsctCellCardView()
                                                                                                        else { return }
        containerView.addSubview(cardView)
        transitionContext.completeTransition(true)
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension CardTransionManager: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition = .presentaion
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition = .dismissal
        return self
    }
}

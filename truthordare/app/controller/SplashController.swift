import Foundation
import UIKit

class SplashController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        UINib(nibName: "SplashView", bundle: nil).instantiate(withOwner: self)

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            AppDelegate.getNavigationController().popViewController(animated: false)
            AppDelegate.getNavigationController().pushViewController(PlayerController(), animated: false)
        })

    }

}

import UIKit
import IQKeyboardManagerSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var session: Session!
    static var appDelegate: AppDelegate!


    static func getNavigationController() -> (UINavigationController) {
        let window = UIApplication.shared.delegate!.window!!
        return window.rootViewController as! UINavigationController
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Session.load(appDelegate: self)
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = UIColor.white
        let navigationController = UINavigationController(rootViewController: SplashController())
        navigationController.setNavigationBarHidden(true, animated: false)
        window?.rootViewController = navigationController
        window!.makeKeyAndVisible()

        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true;

        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        Session.save(appDelegate: self)
    }
}

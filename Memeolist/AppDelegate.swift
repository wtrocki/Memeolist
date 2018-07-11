import IQKeyboardManagerSwift
import UIKit
import AGSAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        
        // create the authentication config
        let authenticationConfig = AuthenticationConfig(redirectURL: "memeolist://callback")
        try! AgsAuth.instance.configure(authConfig: authenticationConfig)
        if let user = try! AgsAuth.instance.currentUser() {
            print(user);
        } else {
            let rootViewController = LoginViewController()
            window?.rootViewController = UINavigationController(rootViewController: rootViewController)
            window?.makeKeyAndVisible()
            return true;
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
        do {
            return try AgsAuth.instance.resumeAuth(url: url as URL)
        } catch AgsAuth.Errors.serviceNotConfigured {
            print("AeroGear auth service is not configured")
        } catch {
            fatalError("Unexpected error: \(error).")
        }
        return false
    }
}

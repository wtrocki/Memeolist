import Apollo
import UIKit

// TODO: Initialize client from config
let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    // Add additional headers as needed
    // configuration.httpAdditionalHeaders = ["Authorization": "Bearer <token>"] // Replace `<token>`

    let url = URL(string: "https://api.graph.cool/simple/v1/cjiyvc1wa40kg011846ev0ff8")!

    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        apollo.cacheKeyForObject = { $0["id"] }
        return true
    }
}

import UIKit
import Apollo

// TODO: Initialize client from config

// Change localhost to your machine's local IP address when running from a device
let apollo = ApolloClient(url: URL(string: "https://api.graph.cool/simple/v1/cjiyvc1wa40kg011846ev0ff8")!)

//let apollo: ApolloClient = {
//    let configuration = URLSessionConfiguration.default
//    // Add additional headers as needed
//    configuration.httpAdditionalHeaders = ["Authorization": "Bearer <token>"] // Replace `<token>`
//
//    let url = URL(string: "http://localhost:8080/graphql")!
//
//    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
//}()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        apollo.cacheKeyForObject = { $0["id"] }
        return true
    }
}


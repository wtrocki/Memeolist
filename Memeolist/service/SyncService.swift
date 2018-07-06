import Apollo
import Foundation

public class SyncService {

    public static let instance = SyncService()
    public let serverUrl = "https://api.graph.cool/simple/v1/cjiyvc1wa40kg011846ev0ff8"

    // TODO: Initialize client from config
    let client: ApolloClient

    init() {
        let configuration = URLSessionConfiguration.default
        let url = URL(string: self.serverUrl)!
        client = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        client.cacheKeyForObject = { $0["id"] }
    }
}

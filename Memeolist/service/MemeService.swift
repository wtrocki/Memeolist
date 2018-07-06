import Alamofire
import Foundation
import UIKit

/**
  Service used to interact with meme generators api
*/
public class MemeService {

    public static let instance = MemeService()

    private let url: String = "https://api.imgur.com/3/upload"
    private let imgurToken: String = "f1041ec178352c6"
    private let headersMap: Dictionary<String, String>

    init() {
        headersMap = ["Authorization": "Client-ID " + self.imgurToken]
    }

    func publishRawImage(_ image: UIImage, _ username: String, _ handler: @escaping (Error?, String?) -> Swift.Void) {
        let imageData = UIImagePNGRepresentation(image)
        let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)

        let parameters = [
            "image": base64Image
        ]

        Alamofire.upload(multipartFormData: { multipartFormData in
            if let imageData = UIImageJPEGRepresentation(image, 1) {
                multipartFormData.append(imageData, withName: username, fileName: "\(username).png", mimeType: "image/png")
            }

            for (key, value) in parameters {
                multipartFormData.append((value?.data(using: .utf8))!, withName: key)
        } }, to: self.url, method: .post, headers: self.headersMap,
        encodingCompletion: { encodingResult in
            switch encodingResult {
            case let .success(upload, _, _):
                upload.response { response in
                    //This is what you have been missing
                    let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: Any]
                    let imageDic = json?["data"] as? [String: Any]
                    let link = imageDic?["link"]
                    print("Saved image: ", imageDic?["link"] ?? "Undefined")
                    handler(nil, link as! String? ?? nil)
                }
            case let .failure(encodingError):
                print("error:\(encodingError)")
                handler(encodingError, nil)
            }
        })
    }
    
    public func createMemeUrl(imageUrl: String, top: String, bottom: String) -> String {
        let topText =  top.replacingOccurrences(of: " ", with: "_")
        let bottomText =  bottom.replacingOccurrences(of: " ", with: "_")
        return "https://memegen.link/custom/"  + topText + "/" + bottomText + ".jpg" +
            "?alt=" + imageUrl + "&font=opensans-extrabold";
    }


}

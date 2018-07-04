import UIKit
import Alamofire

class CreateMemeController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var memeView: UIImageView!
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var bottomText: UILabel!
    @IBOutlet weak var topTextEdit: UITextField!
    @IBOutlet weak var bottomTextEdit: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateMemeController.singleTapping(recognizer:)))
        singleTap.numberOfTapsRequired = 1;
        memeView.addGestureRecognizer(singleTap)
        imagePicker.delegate = self
    }

    @objc func singleTapping(recognizer: UIGestureRecognizer) {
        print("image clicked")
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        topText.isHidden = false;
        bottomText.isHidden = false;
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            memeView.contentMode = .scaleAspectFit
            memeView.image = pickedImage
            publishImgurImage(image: pickedImage, for: "test")
        }
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func publishImgurImage(image: UIImage, for username: String) {
        let imageData = UIImagePNGRepresentation(image)
        let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
        
        let url = "https://api.imgur.com/3/upload"
        
        let parameters = [
            "image": base64Image
        ]
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            if let imageData = UIImageJPEGRepresentation(image, 1) {
                multipartFormData.append(imageData, withName: username, fileName: "\(username).png", mimeType: "image/png")
            }
            
            for (key, value) in parameters {
                multipartFormData.append((value?.data(using: .utf8))!, withName: key)
            }}, to: url, method: .post, headers: ["Authorization": "Client-ID f1041ec178352c6"],
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.response { response in
                            //This is what you have been missing
                            let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String:Any]
                            print(json)
                            let imageDic = json?["data"] as? [String:Any]
                            print(imageDic?["link"])
                        }
                    case .failure(let encodingError):
                        print("error:\(encodingError)")
                    }
        })
        
    }
    
    @IBAction func topTextChanged(_ sender: Any) {
         topText.text = topTextEdit.text;
    }
    @IBAction func bottomTextChanged(_ sender: Any) {
        bottomText.text = bottomTextEdit.text;
    }
}


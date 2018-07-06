import UIImageCropper
import UIKit

class CreateMemeController: UIViewController,
    UINavigationControllerDelegate,
    UIImageCropperProtocol {

    @IBOutlet var memeView: UIImageView!
    @IBOutlet var topText: UILabel!
    @IBOutlet var bottomText: UILabel!
    @IBOutlet var topTextEdit: UITextField!
    @IBOutlet var bottomTextEdit: UITextField!
    @IBOutlet var createButton: UIButton!

    private var publishImage: Bool = false

    private let imagePicker = UIImagePickerController()
    private let cropper = UIImageCropper(cropRatio: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateMemeController.singleTapping(recognizer:)))
        singleTap.numberOfTapsRequired = 1
        memeView.addGestureRecognizer(singleTap)
        cropper.picker = imagePicker
        cropper.delegate = self
        cropper.cropButtonText = "Crop"
        cropper.cancelButtonText = "Cancel"
    }

    @objc func singleTapping(recognizer: UIGestureRecognizer) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: {
            self.topText.isHidden = false
            self.bottomText.isHidden = false
        })
    }

    func didCropImage(originalImage: UIImage?, croppedImage: UIImage?) {
        memeView.contentMode = .scaleToFill
        memeView.image = croppedImage
        imagePicker.dismiss(animated: true, completion: nil)
    }

    func didCancel() {
        imagePicker.dismiss(animated: true, completion: nil)
    }

    fileprivate func createMemeInGraphql(_ rawMemeUrl: String, _ indicator: UIActivityIndicatorView) {
        let url = MemeService.instance.createMemeUrl(imageUrl: rawMemeUrl,
                                                     top: self.topTextEdit.text ?? "",
                                                     bottom: self.bottomTextEdit.text ?? "")

        SyncService.instance.client.perform(mutation: NewMemeMutation(url: url, votes: 2)) { result, error in
            indicator.stopAnimating()
            if result != nil {
                let alert = UIAlertController(title: "Success", message: "Meme created", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: {
                    self.navigationController?.popToRootViewController(animated: true)
                })
            } else {
                let alert = UIAlertController(title: "Error", message: "Failed to create meme", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }

            return
        }
    }

    @IBAction func createMemeAction(_ sender: Any) {
        if self.topTextEdit.text?.isEmpty ?? false  || self.bottomTextEdit.text?.isEmpty ?? false {
            let alert = UIAlertController(title: "Validation error", message: "Missing required fields", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard let image = self.memeView.image else {
            return
        }
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubview(toFront: indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        indicator.startAnimating()
        if publishImage {
            MemeService.instance.publishRawImage(image, "Undefined", { error, url in
                guard let rawMemeUrl = url else {
                    let alert = UIAlertController(title: "Problem with uploading image.", message: "Cannot upload meme image", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                self.createMemeInGraphql(rawMemeUrl, indicator)
            })
        } else {
            // Testing only
            self.createMemeInGraphql("", indicator)
        }
    }

    @IBAction func topTextChanged(_ sender: Any) {
        topText.text = topTextEdit.text
    }

    @IBAction func bottomTextChanged(_ sender: Any) {
        bottomText.text = bottomTextEdit.text
    }
}

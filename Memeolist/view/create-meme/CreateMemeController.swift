import UIKit

class CreateMemeController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var memeView: UIImageView!
    @IBOutlet var topText: UILabel!
    @IBOutlet var bottomText: UILabel!
    @IBOutlet var topTextEdit: UITextField!
    @IBOutlet var bottomTextEdit: UITextField!
    @IBOutlet var createButton: UIButton!

    private let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateMemeController.singleTapping(recognizer:)))
        singleTap.numberOfTapsRequired = 1
        memeView.addGestureRecognizer(singleTap)
        imagePicker.delegate = self
    }

    @objc func singleTapping(recognizer: UIGestureRecognizer) {
        print("image clicked")
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary

        present(imagePicker, animated: true, completion: nil)
        topText.isHidden = false
        bottomText.isHidden = false
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            memeView.contentMode = .scaleAspectFit
            memeView.image = pickedImage
        }

        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func createMemeAction(_ sender: Any) {
        guard let image = self.memeView.image else {
            let alert = UIAlertController(title: "Missing image", message: "Need to add image to build meme", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = view.center
        self.view.addSubview(indicator)
        self.view.bringSubview(toFront: indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        indicator.startAnimating()
        let memeService = MemeService.instance
        memeService.publishRawImage(image, "Undefined", { error, url in
            guard let rawMemeUrl = url else {
                let alert = UIAlertController(title: "Problem with uploading image.", message: "Cannot upload meme image", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
                return
            }
            let url = memeService.createMemeUrl(imageUrl: rawMemeUrl,
                                                top:  self.topTextEdit.text ?? "",
                                                bottom: self.bottomTextEdit.text ?? "")
            
            apollo.perform(mutation: NewMemeMutation(url: url)) { (result, error) in
                indicator.stopAnimating()
                let alert = UIAlertController(title: "Meme created.", message: "Meme created", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
                return
            }
        })
    }

    @IBAction func topTextChanged(_ sender: Any) {
        topText.text = topTextEdit.text
    }

    @IBAction func bottomTextChanged(_ sender: Any) {
        bottomText.text = bottomTextEdit.text
    }
}

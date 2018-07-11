import UIKit
import AGSAuth

public class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let scrollViewWidth:CGFloat = self.scrollView.frame.width-40
        let scrollViewHeight:CGFloat = self.scrollView.frame.height-40
        self.loginButton.layer.cornerRadius = 10.0
        loginButton.alpha = 0.6;
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "login1")
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "login2")
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "login3")
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)

        self.scrollView.contentSize = CGSize(width:scrollViewWidth * 3, height:scrollViewHeight)
        self.scrollView.delegate = self
        //self.pageControl.currentPage = 0
        
        // Auto scroll
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextPage (){
        let pageWidth:CGFloat = self.scrollView.frame.width
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        var slideToX = contentOffset + pageWidth
        if  contentOffset + pageWidth > 2 * pageWidth
        {
            slideToX = 0
            self.pageControl.currentPage = 0
        } else {
            self.pageControl.currentPage = self.pageControl.currentPage + 1
        }
        self.scrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.scrollView.frame.height), animated: true)
        
    }
    
   public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width+40
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 2 {
            loginButton.alpha = 1;
        }
    }

    public func onLoginComplete(user: User?, err: Error?) {
        if let error = err {
            print(error)
            return
        }
        let currentUser = user
        print(currentUser ?? "");
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "memeListViewController")
        self.navigationController!.present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    @IBAction public func onLoginPressed(_ sender: Any) {
         try! AgsAuth.instance.login(presentingViewController: self, onCompleted: onLoginComplete)
    }
}

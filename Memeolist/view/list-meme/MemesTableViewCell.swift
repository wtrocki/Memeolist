import UIKit
import Apollo
import Kingfisher

class MemesTableViewCell: UITableViewCell {
    
    var memeId: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var memeImageView: UIImageView!
    
    func configure(with meme: MemeDetails) {
        memeId = meme.id
        let url = URL(string: meme.photoUrl)
        memeImageView.kf.setImage(with: url)
        
        titleLabel?.text = meme.title
        votesLabel?.text = "\(meme.votes ?? 0) votes"
    }
    
    
    @IBAction func upvote() {
        guard let memeId = memeId else { return }
        // TODO: implement mutation
//        apollo.perform(mutation: UpvoteMemeMutation(memeId: memeId)) { (result, error) in
//            if let error = error {
//                NSLog("Error while attempting to upvote post: \(error.localizedDescription)")
//            }
//        }
    }
}

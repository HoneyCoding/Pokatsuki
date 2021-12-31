
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var profileImageView: CircularImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var member: Member?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        if let imageAssetName = member?.imageAssetName {
            let image = UIImage(named: imageAssetName)
            profileImageView.setImage(using: image)
        }
        nameLabel.text = member?.name
        descriptionLabel.text = member?.description
        self.title = member?.name
    }
}


import UIKit

// MARK: - Property and Initializer
class MainTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: MainTableViewCell.self)
    @IBOutlet private weak var profileImageView: CircularImageView! {
        didSet {
            profileImageView.clearImage()
        }
    }
    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 1
        }
    }
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var nameText: String? {
        get {
            return nameLabel.text
        }
        set {
            nameLabel.text = newValue
        }
    }
    
    var descriptionText: String? {
        get {
            return descriptionLabel.text
        }
        set {
            descriptionLabel.text = newValue
        }
    }
    
    var profileImage: UIImage? {
        get {
            return profileImageView.image
        }
        set {
            if let profileImage = newValue {
                profileImageView.setImage(using: profileImage)
            } else {
                profileImageView.clearImage()
            }
        }
    }
}

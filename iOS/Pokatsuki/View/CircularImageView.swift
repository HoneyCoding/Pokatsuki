//
//  CircularImageView.swift
//  Pokatsuki
//
//  Created by 김진태 on 2021/12/26.
//

import UIKit

// MARK: - Setup ImageView
@IBDesignable
class CircularImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupImageView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupImageView()
        let bundle = Bundle(for: CircularImageView.self)
        clearImage(with: bundle)
    }
    
    private func setupImageView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}

// MARK: - Method
extension CircularImageView {
    func setImage(using image: UIImage?) {
        self.image = image
        self.backgroundColor = UIColor.clear
        self.contentMode = .scaleAspectFill
    }
    
    func clearImage(with bundle: Bundle? = nil) {
        self.image = UIImage(named: "round_person_black",
                             in: bundle,
                             compatibleWith: self.traitCollection)?
            .withTintColor(UIColor.parseColor(with: "#000000", alpha: 66 / 255))
        self.backgroundColor = UIColor.parseColor(with: "#03A9F4")
        self.contentMode = .scaleAspectFit
    }
}

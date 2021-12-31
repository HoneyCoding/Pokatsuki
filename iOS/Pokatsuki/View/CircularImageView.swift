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
    
    private let defaultPadding: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
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
    
    private func commonInit() {
        clearImage()
    }
}

// MARK: - Method
extension CircularImageView {
    func setImage(using image: UIImage?) {
        self.image = image
        self.backgroundColor = UIColor.clear
        self.contentMode = .scaleAspectFill
    }
    
    final func clearImage(with bundle: Bundle) {
        self.clearImage(with: bundle, padding: nil)
    }
    
    final func clearImage() {
        self.clearImage(with: nil, padding: defaultPadding)
    }
    
    private func clearImage(with bundle: Bundle?, padding insets: UIEdgeInsets?) {
        var personIconImage = UIImage(named: AssetName.Image.personIcon,
                             in: bundle,
                             compatibleWith: self.traitCollection)?
            .withTintColor(UIColor.parseColor(with: "#000000", alpha: 150 / 255))
        
        if let insets = insets {
            personIconImage = personIconImage?.padding(insets)
        }
        
        self.image = personIconImage
        self.backgroundColor = UIColor.parseColor(with: "#03A9F4")
        self.contentMode = .scaleAspectFit
    }
}

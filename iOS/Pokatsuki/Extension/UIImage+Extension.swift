//
//  UIImage+Extension.swift
//  Pokatsuki
//
//  Created by 김진태 on 2021/12/31.
//

import UIKit.UIImage

extension UIImage {
    func padding(_ insets: UIEdgeInsets) -> UIImage {
        let targetWidth: CGFloat = self.size.width + insets.left + insets.right
        let targetHeight: CGFloat = self.size.height + insets.top + insets.bottom
        let targetSize: CGSize = CGSize(width: targetWidth, height: targetHeight)
        let targetOrigin: CGPoint = CGPoint(x: insets.left, y: insets.top)
    
        let format: UIGraphicsImageRendererFormat = UIGraphicsImageRendererFormat()
        format.scale = self.scale
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        
        let renderedImage = renderer.image { _ in
            self.draw(in: CGRect(origin: targetOrigin, size: self.size))
        }.withRenderingMode(self.renderingMode)
        return renderedImage
    }
}

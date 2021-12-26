//
//  UIColor+Extension.swift
//  Pokatsuki
//
//  Created by 김진태 on 2021/12/26.
//

import UIKit.UIColor

extension UIColor {
    static func parseColor(with hexCode: String, alpha: CGFloat = 1.0) -> UIColor {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        let parsedColor = UIColor.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255,
                     green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255,
                     blue: CGFloat(rgbValue & 0x0000FF) / 255,
                     alpha: alpha)
        return parsedColor
    }
}

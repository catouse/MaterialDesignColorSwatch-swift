//
//  MaterialColor.swift
//  MaterialDesignColorSwatch
//
//  Created by Sun Hao on 15/3/21.
//  Copyright (c) 2015年 Catouse.com. All rights reserved.
//

import Foundation

#if os(iOS)
    import UIKit
    typealias Color = UIColor
#else
    import Cocoa
    typealias Color = NSColor
#endif

typealias RGBA = UInt

extension Color {
    
    convenience init(rgb: RGBA, alpha: CGFloat) {
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((rgb & 0xFF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    convenience init(rgba: RGBA){
        let sRgba = min(rgba,0xFFFFFFFF)
        let red: CGFloat = CGFloat((sRgba & 0xFF000000) >> 24) / 255.0
        let green: CGFloat = CGFloat((sRgba & 0x00FF0000) >> 16) / 255.0
        let blue: CGFloat = CGFloat((sRgba & 0x0000FF00) >> 8) / 255.0
        let alpha: CGFloat = CGFloat(sRgba & 0x000000FF) / 255.0
        
        self.init(red: red, green: green, blue:blue, alpha:alpha)
    }
}

extension RGBA {
    
    var color: Color {
        return self > 0x00FFFFFF ? Color(rgba: self) : Color(rgb: self, alpha: 1)
    }
}

typealias MaterialColorSet = (hue: RGBA, text: RGBA)

struct MaterialColor {
    
    struct Swatch {
        
        static let P0   : MaterialColorSet   = (hue: 0xFFFFFFFF, text: 0x000000DE)
        static let P1000: MaterialColorSet   = (hue: 0x000000FF, text: 0xFFFFFFDE)
        
        let P50  : MaterialColorSet
        let P100 : MaterialColorSet
        let P200 : MaterialColorSet
        let P300 : MaterialColorSet
        let P400 : MaterialColorSet
        let P500 : MaterialColorSet
        let P600 : MaterialColorSet
        let P700 : MaterialColorSet
        let P800 : MaterialColorSet
        let P900 : MaterialColorSet
        let A100 : MaterialColorSet
        let A200 : MaterialColorSet
        let A400 : MaterialColorSet
        let A700 : MaterialColorSet
        
        let name: String
        
        init(name: String, colorSet: [MaterialColorSet]) {
            assert(colorSet.count >= 14, "Need more color set to create a swatch.")
            
            self.name = name
            P50  = colorSet[0]
            P100 = colorSet[1]
            P200 = colorSet[2]
            P300 = colorSet[3]
            P400 = colorSet[4]
            P500 = colorSet[5]
            P600 = colorSet[6]
            P700 = colorSet[7]
            P800 = colorSet[8]
            P900 = colorSet[9]
            A100 = colorSet[10]
            A200 = colorSet[11]
            A400 = colorSet[12]
            A700 = colorSet[13]
        }
        
        var primary: MaterialColorSet {
            return P500
        }
    }
    
    static let White: MaterialColorSet = (hue: 0xFFFFFFFF, text: 0x000000DE)
    static let Black: MaterialColorSet = (hue: 0x000000FF, text: 0xFFFFFFDE)
    
    static let Red = Swatch(name: "Red", colorSet: [
        (hue: 0xFFEBEEFF, text: 0x000000DE),
        (hue: 0xFFCDD2FF, text: 0x000000DE),
        (hue: 0xEF9A9AFF, text: 0x000000DE),
        (hue: 0xE57373FF, text: 0x000000DE),
        (hue: 0xEF5350FF, text: 0x000000DE),
        (hue: 0xF44336FF, text: 0xFFFFFFFF),
        (hue: 0xE53935FF, text: 0xFFFFFFFF),
        (hue: 0xD32F2FFF, text: 0xFFFFFFFF),
        (hue: 0xC62828FF, text: 0xFFFFFFDE),
        (hue: 0xB71C1CFF, text: 0xFFFFFFDE),
        (hue: 0xFF8A80FF, text: 0x000000DE),
        (hue: 0xFF5252FF, text: 0xFFFFFFFF),
        (hue: 0xFF1744FF, text: 0xFFFFFFFF),
        (hue: 0xD50000FF, text: 0xFFFFFFFF)
        ])
    
    static let Pink = Swatch(name:"Pink", colorSet: [
        (hue: 0xFCE4ECFF, text: 0x000000DE),
        (hue: 0xF8BBD0FF, text: 0x000000DE),
        (hue: 0xF48FB1FF, text: 0x000000DE),
        (hue: 0xF06292FF, text: 0x000000DE),
        (hue: 0xEC407AFF, text: 0x000000DE),
        (hue: 0xE91E63FF, text: 0xFFFFFFFF),
        (hue: 0xD81B60FF, text: 0xFFFFFFFF),
        (hue: 0xC2185BFF, text: 0xFFFFFFDE),
        (hue: 0xAD1457FF, text: 0xFFFFFFDE),
        (hue: 0x880E4FFF, text: 0xFFFFFFDE),
        (hue: 0xFF80ABFF, text: 0x000000DE),
        (hue: 0xFF4081FF, text: 0xFFFFFFFF),
        (hue: 0xF50057FF, text: 0xFFFFFFFF),
        (hue: 0xC51162FF, text: 0xFFFFFFFF)
        ])
    
    static let Purple = Swatch(name:"Purple", colorSet: [
        (hue: 0xF3E5F5FF, text: 0x000000DE),
        (hue: 0xE1BEE7FF, text: 0x000000DE),
        (hue: 0xCE93D8FF, text: 0x000000DE),
        (hue: 0xBA68C8FF, text: 0xFFFFFFFF),
        (hue: 0xAB47BCFF, text: 0xFFFFFFFF),
        (hue: 0x9C27B0FF, text: 0xFFFFFFDE),
        (hue: 0x8E24AAFF, text: 0xFFFFFFDE),
        (hue: 0x7B1FA2FF, text: 0xFFFFFFDE),
        (hue: 0x6A1B9AFF, text: 0xFFFFFFDE),
        (hue: 0x4A148CFF, text: 0xFFFFFFDE),
        (hue: 0xEA80FCFF, text: 0x000000DE),
        (hue: 0xE040FBFF, text: 0xFFFFFFFF),
        (hue: 0xD500F9FF, text: 0xFFFFFFFF),
        (hue: 0xAA00FFFF, text: 0xFFFFFFFF)
        ])
    
    static let DeepPurple = Swatch(name:"DeepPurple", colorSet: [
        (hue: 0xEDE7F6FF, text: 0x000000DE),
        (hue: 0xD1C4E9FF, text: 0x000000DE),
        (hue: 0xB39DDBFF, text: 0x000000DE),
        (hue: 0x9575CDFF, text: 0xFFFFFFFF),
        (hue: 0x7E57C2FF, text: 0xFFFFFFFF),
        (hue: 0x673AB7FF, text: 0xFFFFFFDE),
        (hue: 0x5E35B1FF, text: 0xFFFFFFDE),
        (hue: 0x512DA8FF, text: 0xFFFFFFDE),
        (hue: 0x4527A0FF, text: 0xFFFFFFDE),
        (hue: 0x311B92FF, text: 0xFFFFFFDE),
        (hue: 0xB388FFFF, text: 0x000000DE),
        (hue: 0x7C4DFFFF, text: 0xFFFFFFFF),
        (hue: 0x651FFFFF, text: 0xFFFFFFDE),
        (hue: 0x6200EAFF, text: 0xFFFFFFDE)
        ])
    
    static let Indigo = Swatch(name:"Indigo", colorSet: [
        (hue: 0xE8EAF6FF, text: 0x000000DE),
        (hue: 0xC5CAE9FF, text: 0x000000DE),
        (hue: 0x9FA8DAFF, text: 0x000000DE),
        (hue: 0x7986CBFF, text: 0xFFFFFFFF),
        (hue: 0x5C6BC0FF, text: 0xFFFFFFFF),
        (hue: 0x3F51B5FF, text: 0xFFFFFFDE),
        (hue: 0x3949ABFF, text: 0xFFFFFFDE),
        (hue: 0x303F9FFF, text: 0xFFFFFFDE),
        (hue: 0x283593FF, text: 0xFFFFFFDE),
        (hue: 0x1A237EFF, text: 0xFFFFFFDE),
        (hue: 0x8C9EFFFF, text: 0x000000DE),
        (hue: 0x536DFEFF, text: 0xFFFFFFFF),
        (hue: 0x3D5AFEFF, text: 0xFFFFFFFF),
        (hue: 0x304FFEFF, text: 0xFFFFFFDE)
        ])
    
    static let Blue = Swatch(name:"Blue", colorSet: [
        (hue: 0xE3F2FDFF, text: 0x000000DE),
        (hue: 0xBBDEFBFF, text: 0x000000DE),
        (hue: 0x90CAF9FF, text: 0x000000DE),
        (hue: 0x64B5F6FF, text: 0x000000DE),
        (hue: 0x42A5F5FF, text: 0x000000DE),
        (hue: 0x2196F3FF, text: 0xFFFFFFFF),
        (hue: 0x1E88E5FF, text: 0xFFFFFFFF),
        (hue: 0x1976D2FF, text: 0xFFFFFFFF),
        (hue: 0x1565C0FF, text: 0xFFFFFFDE),
        (hue: 0x0D47A1FF, text: 0xFFFFFFDE),
        (hue: 0x82B1FFFF, text: 0x000000DE),
        (hue: 0x448AFFFF, text: 0xFFFFFFFF),
        (hue: 0x2979FFFF, text: 0xFFFFFFFF),
        (hue: 0x2962FFFF, text: 0xFFFFFFFF)
        ])
    
    static let LightBlue = Swatch(name:"LightBlue", colorSet: [
        (hue: 0xE1F5FEFF, text: 0x000000DE),
        (hue: 0xB3E5FCFF, text: 0x000000DE),
        (hue: 0x81D4FAFF, text: 0x000000DE),
        (hue: 0x4FC3F7FF, text: 0x000000DE),
        (hue: 0x29B6F6FF, text: 0x000000DE),
        (hue: 0x03A9F4FF, text: 0xFFFFFFFF),
        (hue: 0x039BE5FF, text: 0xFFFFFFFF),
        (hue: 0x0288D1FF, text: 0xFFFFFFFF),
        (hue: 0x0277BDFF, text: 0xFFFFFFFF),
        (hue: 0x01579BFF, text: 0xFFFFFFDE),
        (hue: 0x80D8FFFF, text: 0x000000DE),
        (hue: 0x40C4FFFF, text: 0x000000DE),
        (hue: 0x00B0FFFF, text: 0x000000DE),
        (hue: 0x0091EAFF, text: 0xFFFFFFFF)
        ])
    
    static let Cyan = Swatch(name:"Cyan", colorSet: [
        (hue: 0xE0F7FAFF, text: 0x000000DE),
        (hue: 0xB2EBF2FF, text: 0x000000DE),
        (hue: 0x80DEEAFF, text: 0x000000DE),
        (hue: 0x4DD0E1FF, text: 0x000000DE),
        (hue: 0x26C6DAFF, text: 0x000000DE),
        (hue: 0x00BCD4FF, text: 0xFFFFFFFF),
        (hue: 0x00ACC1FF, text: 0xFFFFFFFF),
        (hue: 0x0097A7FF, text: 0xFFFFFFFF),
        (hue: 0x00838FFF, text: 0xFFFFFFFF),
        (hue: 0x006064FF, text: 0xFFFFFFDE),
        (hue: 0x84FFFFFF, text: 0x000000DE),
        (hue: 0x18FFFFFF, text: 0x000000DE),
        (hue: 0x00E5FFFF, text: 0x000000DE),
        (hue: 0x00B8D4FF, text: 0x000000DE)
        ])
    
    static let Teal = Swatch(name:"Teal", colorSet: [
        (hue: 0xE0F2F1FF, text: 0x000000DE),
        (hue: 0xB2DFDBFF, text: 0x000000DE),
        (hue: 0x80CBC4FF, text: 0x000000DE),
        (hue: 0x4DB6ACFF, text: 0x000000DE),
        (hue: 0x26A69AFF, text: 0x000000DE),
        (hue: 0x009688FF, text: 0xFFFFFFFF),
        (hue: 0x00897BFF, text: 0xFFFFFFFF),
        (hue: 0x00796BFF, text: 0xFFFFFFFF),
        (hue: 0x00695CFF, text: 0xFFFFFFDE),
        (hue: 0x004D40FF, text: 0xFFFFFFDE),
        (hue: 0xA7FFEBFF, text: 0x000000DE),
        (hue: 0x64FFDAFF, text: 0x000000DE),
        (hue: 0x1DE9B6FF, text: 0x000000DE),
        (hue: 0x00BFA5FF, text: 0x000000DE)
        ])
    
    static let Green = Swatch(name:"Green", colorSet: [
        (hue: 0xE8F5E9FF, text: 0x000000DE),
        (hue: 0xC8E6C9FF, text: 0x000000DE),
        (hue: 0xA5D6A7FF, text: 0x000000DE),
        (hue: 0x81C784FF, text: 0x000000DE),
        (hue: 0x66BB6AFF, text: 0x000000DE),
        (hue: 0x4CAF50FF, text: 0xFFFFFFFF),
        (hue: 0x43A047FF, text: 0xFFFFFFFF),
        (hue: 0x388E3CFF, text: 0xFFFFFFFF),
        (hue: 0x2E7D32FF, text: 0xFFFFFFDE),
        (hue: 0x1B5E20FF, text: 0xFFFFFFDE),
        (hue: 0xB9F6CAFF, text: 0x000000DE),
        (hue: 0x69F0AEFF, text: 0x000000DE),
        (hue: 0x00E676FF, text: 0x000000DE),
        (hue: 0x00C853FF, text: 0x000000DE)
        ])
    
    static let LightGreen = Swatch(name:"LightGreen", colorSet: [
        (hue: 0xF1F8E9FF, text: 0x000000DE),
        (hue: 0xDCEDC8FF, text: 0x000000DE),
        (hue: 0xC5E1A5FF, text: 0x000000DE),
        (hue: 0xAED581FF, text: 0x000000DE),
        (hue: 0x9CCC65FF, text: 0x000000DE),
        (hue: 0x8BC34AFF, text: 0x000000DE),
        (hue: 0x7CB342FF, text: 0x000000DE),
        (hue: 0x689F38FF, text: 0x000000DE),
        (hue: 0x558B2FFF, text: 0xFFFFFFFF),
        (hue: 0x33691EFF, text: 0xFFFFFFFF),
        (hue: 0xCCFF90FF, text: 0x000000DE),
        (hue: 0xB2FF59FF, text: 0x000000DE),
        (hue: 0x76FF03FF, text: 0x000000DE),
        (hue: 0x64DD17FF, text: 0x000000DE)
        ])
    
    static let Lime = Swatch(name:"Lime", colorSet: [
        (hue: 0xF9FBE7FF, text: 0x000000DE),
        (hue: 0xF0F4C3FF, text: 0x000000DE),
        (hue: 0xE6EE9CFF, text: 0x000000DE),
        (hue: 0xDCE775FF, text: 0x000000DE),
        (hue: 0xD4E157FF, text: 0x000000DE),
        (hue: 0xCDDC39FF, text: 0x000000DE),
        (hue: 0xC0CA33FF, text: 0x000000DE),
        (hue: 0xAFB42BFF, text: 0x000000DE),
        (hue: 0x9E9D24FF, text: 0x000000DE),
        (hue: 0x827717FF, text: 0xFFFFFFFF),
        (hue: 0xF4FF81FF, text: 0x000000DE),
        (hue: 0xEEFF41FF, text: 0x000000DE),
        (hue: 0xC6FF00FF, text: 0x000000DE),
        (hue: 0xAEEA00FF, text: 0x000000DE)
        ])
    
    static let Yellow = Swatch(name:"Yellow", colorSet: [
        (hue: 0xFFFDE7FF, text: 0x000000DE),
        (hue: 0xFFF9C4FF, text: 0x000000DE),
        (hue: 0xFFF59DFF, text: 0x000000DE),
        (hue: 0xFFF176FF, text: 0x000000DE),
        (hue: 0xFFEE58FF, text: 0x000000DE),
        (hue: 0xFFEB3BFF, text: 0x000000DE),
        (hue: 0xFDD835FF, text: 0x000000DE),
        (hue: 0xFBC02DFF, text: 0x000000DE),
        (hue: 0xF9A825FF, text: 0x000000DE),
        (hue: 0xF57F17FF, text: 0x000000DE),
        (hue: 0xFFFF8DFF, text: 0x000000DE),
        (hue: 0xFFFF00FF, text: 0x000000DE),
        (hue: 0xFFEA00FF, text: 0x000000DE),
        (hue: 0xFFD600FF, text: 0x000000DE)
        ])
    
    static let Amber = Swatch(name:"Amber", colorSet: [
        (hue: 0xFFF8E1FF, text: 0x000000DE),
        (hue: 0xFFECB3FF, text: 0x000000DE),
        (hue: 0xFFE082FF, text: 0x000000DE),
        (hue: 0xFFD54FFF, text: 0x000000DE),
        (hue: 0xFFCA28FF, text: 0x000000DE),
        (hue: 0xFFC107FF, text: 0x000000DE),
        (hue: 0xFFB300FF, text: 0x000000DE),
        (hue: 0xFFA000FF, text: 0x000000DE),
        (hue: 0xFF8F00FF, text: 0x000000DE),
        (hue: 0xFF6F00FF, text: 0x000000DE),
        (hue: 0xFFE57FFF, text: 0x000000DE),
        (hue: 0xFFD740FF, text: 0x000000DE),
        (hue: 0xFFC400FF, text: 0x000000DE),
        (hue: 0xFFAB00FF, text: 0x000000DE)
        ])
    
    static let Orange = Swatch(name:"Orange", colorSet: [
        (hue: 0xFFF3E0FF, text: 0x000000DE),
        (hue: 0xFFE0B2FF, text: 0x000000DE),
        (hue: 0xFFCC80FF, text: 0x000000DE),
        (hue: 0xFFB74DFF, text: 0x000000DE),
        (hue: 0xFFA726FF, text: 0x000000DE),
        (hue: 0xFF9800FF, text: 0x000000DE),
        (hue: 0xFB8C00FF, text: 0x000000DE),
        (hue: 0xF57C00FF, text: 0x000000DE),
        (hue: 0xEF6C00FF, text: 0xFFFFFFFF),
        (hue: 0xE65100FF, text: 0xFFFFFFFF),
        (hue: 0xFFD180FF, text: 0x000000DE),
        (hue: 0xFFAB40FF, text: 0x000000DE),
        (hue: 0xFF9100FF, text: 0x000000DE),
        (hue: 0xFF6D00FF, text: 0x00000000)
        ])
    
    static let DeepOrange = Swatch(name:"DeepOrange", colorSet: [
        (hue: 0xFBE9E7FF, text: 0x000000DE),
        (hue: 0xFFCCBCFF, text: 0x000000DE),
        (hue: 0xFFAB91FF, text: 0x000000DE),
        (hue: 0xFF8A65FF, text: 0x000000DE),
        (hue: 0xFF7043FF, text: 0x000000DE),
        (hue: 0xFF5722FF, text: 0xFFFFFFFF),
        (hue: 0xF4511EFF, text: 0xFFFFFFFF),
        (hue: 0xE64A19FF, text: 0xFFFFFFFF),
        (hue: 0xD84315FF, text: 0xFFFFFFFF),
        (hue: 0xBF360CFF, text: 0xFFFFFFFF),
        (hue: 0xFF9E80FF, text: 0x000000DE),
        (hue: 0xFF6E40FF, text: 0x000000DE),
        (hue: 0xFF3D00FF, text: 0xFFFFFFFF),
        (hue: 0xDD2C00FF, text: 0xFFFFFFFF)
        ])
    
    static let Brown = Swatch(name:"Brown", colorSet: [
        (hue: 0xEFEBE9FF, text: 0x000000DE),
        (hue: 0xD7CCC8FF, text: 0x000000DE),
        (hue: 0xBCAAA4FF, text: 0x000000DE),
        (hue: 0xA1887FFF, text: 0xFFFFFFFF),
        (hue: 0x8D6E63FF, text: 0xFFFFFFFF),
        (hue: 0x795548FF, text: 0xFFFFFFDE),
        (hue: 0x6D4C41FF, text: 0xFFFFFFDE),
        (hue: 0x5D4037FF, text: 0xFFFFFFDE),
        (hue: 0x4E342EFF, text: 0xFFFFFFDE),
        (hue: 0x3E2723FF, text: 0xFFFFFFDE),
        (hue: 0xD7CCC8FF, text: 0x000000DE),
        (hue: 0xBCAAA4FF, text: 0x000000DE),
        (hue: 0x6D4C41FF, text: 0xFFFFFFFF),
        (hue: 0x4E342EFF, text: 0xFFFFFFFF)
        ])
    
    static let Grey = Swatch(name:"Grey", colorSet: [
        (hue: 0xFAFAFAFF, text: 0x000000DE),
        (hue: 0xF5F5F5FF, text: 0x000000DE),
        (hue: 0xEEEEEEFF, text: 0x000000DE),
        (hue: 0xE0E0E0FF, text: 0x000000DE),
        (hue: 0xBDBDBDFF, text: 0x000000DE),
        (hue: 0x9E9E9EFF, text: 0x000000DE),
        (hue: 0x757575FF, text: 0xFFFFFFDE),
        (hue: 0x616161FF, text: 0xFFFFFFDE),
        (hue: 0x424242FF, text: 0xFFFFFFDE),
        (hue: 0x212121FF, text: 0xFFFFFFDE),
        (hue: 0xF1F1F1FF, text: 0x000000DE),
        (hue: 0xEEEEEEFF, text: 0x000000DE),
        (hue: 0x9E9E9EFF, text: 0xFFFFFFFF),
        (hue: 0x333333FF, text: 0xFFFFFFFF)
        ])
    
    static let BlueGrey = Swatch(name:"BlueGrey", colorSet: [
        (hue: 0xECEFF1FF, text: 0x000000DE),
        (hue: 0xCFD8DCFF, text: 0x000000DE),
        (hue: 0xB0BEC5FF, text: 0x000000DE),
        (hue: 0x90A4AEFF, text: 0x000000DE),
        (hue: 0x78909CFF, text: 0xFFFFFFFF),
        (hue: 0x607D8BFF, text: 0xFFFFFFFF),
        (hue: 0x546E7AFF, text: 0xFFFFFFDE),
        (hue: 0x455A64FF, text: 0xFFFFFFDE),
        (hue: 0x37474FFF, text: 0xFFFFFFDE),
        (hue: 0x263238FF, text: 0xFFFFFFDE),
        (hue: 0xCFD8DCFF, text: 0x000000DE),
        (hue: 0xB0BEC5FF, text: 0x000000DE),
        (hue: 0x78909CFF, text: 0xFFFFFFFF),
        (hue: 0x455A64FF, text: 0xFFFFFFFF)
        ])
    
    static let names = ["Red", "Pink", "Purple", "DeepPurple", "Indigo", "Blue",
        "LightBlue", "Cyan", "Teal", "Green", "LightGreen", "Lime", "Yellow",
        "Amber", "Orange", "DeepOrange", "Brown", "Grey", "BlueGrey"]
    
    static let count = 19
    
    static func index(index: Int) -> Swatch? {
        switch index {
        case 0:
            return Red
        case 1:
            return Pink
        case 2:
            return Purple
        case 3:
            return DeepPurple
        case 4:
            return Indigo
        case 5:
            return Blue
        case 6:
            return LightBlue
        case 7:
            return Cyan
        case 8:
            return Teal
        case 9:
            return Green
        case 10:
            return LightGreen
        case 11:
            return Lime
        case 12:
            return Yellow
        case 13:
            return Amber
        case 14:
            return Orange
        case 15:
            return DeepOrange
        case 16:
            return Brown
        case 17:
            return Grey
        case 18:
            return BlueGrey
        default:
            return nil
        }
    }
    
    static func byName(var name: String) -> Swatch? {
        name = name.lowercaseString
        for (index, n) in enumerate(names) {
            if name == n.lowercaseString {
                return MaterialColor.index(index)
            }
        }
        return nil
    }
}

//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Christiaan van Bemmel on 21/08/2019.
//  Copyright © 2019 Christiaan van Bemmel. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {
    var rank: Int = 5 { didSet { setNeedsDisplay(); setNeedsLayout() } }
    var suit: String = "❤️" { didSet { setNeedsDisplay(); setNeedsLayout() } }
    var isFaceUp: Bool = true { didSet { setNeedsDisplay(); setNeedsLayout() } }
    
    private func centerAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: font])
    }
    
    private var cornerString: NSAttributedString {
        return centerAttributedString("\(rank)\n\(suit)", fontSize: 0.0)
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
    }
}

//
//  DashedSlider.swift
//
//
//  Created by Ahmet Yalcinkaya on 1/31/16.
//  Copyright © 2016 ayalcinkaya
//

import UIKit
import CoreGraphics

public class DashedSlider: UISlider {

    let DEFAULT_MARKER_COUNT:Int = 25
    let DEFAULT_MARK_WIDTH:CGFloat = 4.0
    let DEFAULT_TOP_MARGIN:CGFloat = 3.0

    public var selectedBarColor:UIColor! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    public var unselectedBarColor:UIColor! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    public var markColor:UIColor! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    public var handlerColor:UIColor? {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // number of markers to draw
    // 1 to 100
    public var markerCount:Int! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    public var markWidth:CGFloat! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    public var topMargin:CGFloat! {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    public var handlerWidth:CGFloat? {
        didSet {
            self.setNeedsLayout()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure(){
        
        if selectedBarColor == nil {
            selectedBarColor = UIColor.redColor()
        }
        
        if unselectedBarColor == nil {
            unselectedBarColor = UIColor.lightGrayColor()
        }
        
        if markColor == nil {
            markColor = UIColor.whiteColor()
        }
        
        if markWidth == nil {
            markWidth = DEFAULT_MARK_WIDTH
        }
        
        if topMargin == nil {
            topMargin = DEFAULT_TOP_MARGIN
        }
        
        if markerCount == nil {
            markerCount = DEFAULT_MARKER_COUNT
        }
        
    }
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        // Create an innerRect to paint the lines
        let innerRect:CGRect = CGRectInset(rect, 1.0, 1.0)
        
        UIGraphicsBeginImageContextWithOptions(innerRect.size, false, 0)
        let context:CGContextRef = UIGraphicsGetCurrentContext()!
        
        // Selected side
        CGContextSetFillColorWithColor(context, self.selectedBarColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, topMargin, innerRect.size.width, innerRect.size.height - topMargin*2.0))
        let selectedSide:UIImage = UIGraphicsGetImageFromCurrentImageContext().resizableImageWithCapInsets(UIEdgeInsetsZero)
        
        // Unselected side
        CGContextSetFillColorWithColor(context, self.unselectedBarColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, topMargin, innerRect.size.width, innerRect.size.height - (topMargin * 2.0)))
        let unselectedSide:UIImage = UIGraphicsGetImageFromCurrentImageContext().resizableImageWithCapInsets(UIEdgeInsetsZero)
        
        // Set markers on selected side
        selectedSide.drawAtPoint(CGPoint(x: 0, y: 0))
        
        // marker can not be less than 1
        if markerCount <= 0 {
            markerCount = DEFAULT_MARKER_COUNT
        }
        
        let spaceBetweenMarkers:CGFloat = 100.0 / CGFloat(markerCount)
        
        for var i:CGFloat = 0; i < 100 ; i = i + spaceBetweenMarkers {
            CGContextSetLineWidth(context, self.markWidth);
            let position:CGFloat = i * innerRect.size.width / 100.0
            CGContextMoveToPoint(context, position, 0);
            CGContextAddLineToPoint(context, position, CGRectGetHeight(innerRect));
            CGContextSetStrokeColorWithColor(context, self.markColor.CGColor)
            CGContextStrokePath(context);
        }
        
        let selectedStripSide:UIImage = UIGraphicsGetImageFromCurrentImageContext().resizableImageWithCapInsets(UIEdgeInsetsZero)
        
        // Set markers on unselected side
        unselectedSide.drawAtPoint(CGPoint(x: 0, y: 0))
        
        for var i:CGFloat = 0; i < 100 ; i = i + spaceBetweenMarkers {
            CGContextSetLineWidth(context, self.markWidth);
            let position:CGFloat = i * innerRect.size.width / 100.0
            CGContextMoveToPoint(context, position, 0);
            CGContextAddLineToPoint(context, position, CGRectGetHeight(innerRect));
            CGContextSetStrokeColorWithColor(context, self.markColor.CGColor);
            CGContextStrokePath(context);
        }
        
        let unselectedStripSide:UIImage = UIGraphicsGetImageFromCurrentImageContext().resizableImageWithCapInsets(UIEdgeInsetsZero)
        
        UIGraphicsEndImageContext();
        
        self.setMinimumTrackImage(selectedStripSide, forState: UIControlState.Normal)
        self.setMaximumTrackImage(unselectedStripSide, forState: UIControlState.Normal)

        if let trackImageColor = handlerColor,
            let trackImageWidth = handlerWidth {
            let trackImage:UIImage = UIImage.imageWithColor(trackImageColor, cornerRadius: 0.0).imageWithMinimumSize(CGSize(width: trackImageWidth, height: CGRectGetHeight(innerRect)))
            self.setThumbImage(trackImage, forState: UIControlState.Normal)
            self.setThumbImage(trackImage, forState: UIControlState.Highlighted)
            self.setThumbImage(trackImage, forState: UIControlState.Selected)
        }
    }

}

extension UIImage {
    static func imageWithColor(color:UIColor,cornerRadius:CGFloat) -> UIImage {
        let minEdgeSize:CGFloat = cornerRadius * 2 + 1 // edge size from corner radius
        let rect:CGRect = CGRectMake(0, 0, minEdgeSize, minEdgeSize);
        let roundedRect:UIBezierPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        roundedRect.lineWidth = 0;
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        roundedRect.fill()
        roundedRect.stroke()
        roundedRect.addClip()
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image.resizableImageWithCapInsets(UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius))
    }
    
    func imageWithMinimumSize(size:CGSize) -> UIImage {
        let rect:CGRect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), false, 0.0)
        self.drawInRect(rect)
        let resized:UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return resized.resizableImageWithCapInsets(UIEdgeInsets(top: size.height/2, left: size.width/2, bottom: size.height/2, right: size.width/2))
        
    }
}